import 'dart:convert';

import 'package:circles/widgets/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    signUpHandler() {
        print('hello12');
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
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignInPage()),
      );
    }

    return Column(
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
                RaisedButton(
                  color: Color(0xFFa386d9),
                  child: Container(
                    child: Text('sign up'),
                  ),
                  onPressed: signUpHandler,
                ),
              ],
            ),
          )
        ],
      );
  }
}
