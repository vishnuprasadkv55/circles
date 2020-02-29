import 'dart:convert';
import 'dart:io';

import 'package:circles/widgets/shared_pref.dart';
import 'package:circles/widgets/user_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'log_in_home.dart';

class TabLogScreen extends StatefulWidget {
  @override
  _TabLogScreenState createState() => _TabLogScreenState();
}

class _TabLogScreenState extends State<TabLogScreen>
    with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
      vsync: this,
      length: 2,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    final emailController = TextEditingController();
    SharedPref sharedPref = SharedPref();
    final _loginFormKey = GlobalKey<FormState>();
    final _signFormKey = GlobalKey<FormState>();
    resetTab() {
      _tabController.animateTo(0);
    }

    signUpHandler() {
      if (!_signFormKey.currentState.validate()) {
        return;
      }
      print('hello12');
      resetTab();
      var url = 'http://192.168.0.10:3000/user';
      var body = {
        'username': usernameController.text,
        'password': passwordController.text
      };
      http
          .post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      )
          .then((response) {
        print(response.body);
        print('hello1');
      });
    }

    logInHandler() {
      var url = 'http://192.168.0.14:3000/user/login';
      if (!_loginFormKey.currentState.validate()) {
        return;
      }
      var body = {
        'username': usernameController.text,
        'password': passwordController.text
      };
      // print(jsonEncode(body));
      try {
        http
            .post(
          url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(body),
        )
            .then((response) {
          var responseObj = jsonDecode(response.body);
          print(responseObj);
          User user = new User(
              token: responseObj['token'], userDetails: responseObj['userObj']);
          sharedPref.save('user', user.toJson());

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LogInHome()),
          );
        });
      } on SocketException {
        print('hello');
      }
    }

    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://wallpapersite.com/images/pages/pic_w/9471.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TabBar(
                indicatorColor: Colors.transparent,
                controller: _tabController,
                labelColor: Colors.teal,
                unselectedLabelColor: Colors.black26,
                isScrollable: true,
                tabs: <Widget>[
                  Tab(
                    text: "",
                  ),
                  Tab(
                    text: "",
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * .50,
                margin: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 240.0,
                ),
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color(0xFFFFEBEE).withOpacity(0.9)),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 25.0,
                          vertical: 25.0,
                        ),
                        child: Form(
                          key: _loginFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              TextFormField(
                                controller: usernameController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'please enter your username';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'username',
                                ),
                              ),
                              TextFormField(
                                  controller: passwordController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'you must enter a password';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'password',
                                  ),
                                  obscureText: true),
                              SizedBox(
                                height: 30.0,
                              ),
                              RaisedButton(
                                color: Colors.red[200],
                                child: Container(
                                  child: Text('Log in'),
                                ),
                                onPressed: logInHandler,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color(0XFFFFCDD2).withOpacity(0.9),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 25.0,
                          vertical: 25.0,
                        ),
                        child: Form(
                          key: _signFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              TextFormField(
                                controller: usernameController,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'please enter a username';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: 'username',
                                ),
                              ),
                              TextFormField(
                                controller: emailController,
                                validator: (value) {
                                  if (value.isEmpty ||
                                      !emailRegex.hasMatch(value)) {
                                    return 'please enter a valid email';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'email',
                                ),
                              ),
                              TextFormField(
                                  controller: passwordController,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'please enter a password';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'password',
                                  ),
                                  obscureText: true),
                              SizedBox(
                                height: 30.0,
                              ),
                              RaisedButton(
                                color: Colors.red[200],
                                child: Container(
                                  child: Text('Sign up'),
                                ),
                                onPressed: signUpHandler,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
