import 'dart:convert';

import 'package:circles/widgets/shared_pref.dart';
import 'package:circles/widgets/sign_up_page.dart';
import 'package:circles/widgets/log_in_home.dart';
import 'package:circles/widgets/user_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignInPage extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  SharedPref sharedPref = SharedPref();

  @override
  Widget build(BuildContext context) {
    logInHandler() {
      var url = 'http://192.168.0.12:3000/user/login';
      var body = {
        'username': usernameController.text,
        'password': passwordController.text
      };
      print(jsonEncode(body));
      var response = {"error":false,"message":"Validation successful!","token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBQ0wiOnt9LCJhdmF0YXIiOnsiX190eXBlIjoiRmlsZSIsIm5hbWUiOiIiLCJ1cmwiOiIifSwiYmlvIjoiIiwiYmxvY2tlZEJ5IjpbXSwiZnVsbE5hbWUiOiIiLCJpZCI6IjM3ZjI2YmY5LTg0ZmUtNDg0MS1hNzJkLTdlNjNiNGY2YWRjYSIsImlzRm9sbG93aW5nIjpbXSwiaXNSZXBvcnRlZCI6ZmFsc2UsImlzVmVyaWZpZWQiOmZhbHNlLCJtdXRlZEJ5IjpbXSwibm90SW50ZXJlc3RpbmdGb3IiOltdLCJyZXBvcnRNZXNzYWdlIjoiIiwidXNlcm5hbWUiOiJhc3dpbm8iLCJ1c2VybmFtZUxvd2VyY2FzZSI6IiIsIndlYnNpdGUiOiIiLCJpYXQiOjE1ODE5NTc2MjMsImV4cCI6MTU4MTk1OTA2M30.-m1yxH-BJfFqNL5910Dd3U4eW7hiyasNzLXJaqglgL4","userObj":"{\"ACL\":{},\"avatar\":{\"__type\":\"File\",\"name\":\"\",\"url\":\"\"},\"bio\":\"\",\"blockedBy\":[],\"fullName\":\"\",\"id\":\"37f26bf9-84fe-4841-a72d-7e63b4f6adca\",\"isFollowing\":[],\"isReported\":false,\"isVerified\":false,\"mutedBy\":[],\"notInterestingFor\":[],\"reportMessage\":\"\",\"username\":\"aswino\",\"usernameLowercase\":\"\",\"website\":\"\"}"};
      User user = new User(response["token"], response["userObj"]);
      user.printDetails();
      sharedPref.save('user', user.toJson());
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
