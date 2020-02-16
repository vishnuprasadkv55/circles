import 'dart:convert';

import 'package:circles/widgets/sign_up_page.dart';
import 'package:circles/widgets/log_in_home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignInPage extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    logInHandler() {
      var url = 'http://192.168.0.10:3000/user/login';
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
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LogInHome()),
      );
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 120, 10, 10),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(hintText: 'username'),
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(hintText: 'password'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('not a memeber ?'),
                    InkWell(
                      child: Text("Sign Up here"),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpPage()),
                        );
                      },
                    ),
                  ],
                ),
                RaisedButton(
                  color: Color(0xFFa386d9),
                  child: Container(
                    child: Text('Log in'),
                  ),
                  onPressed: logInHandler,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
