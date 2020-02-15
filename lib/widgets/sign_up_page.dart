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
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignInPage()),
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
      ),
    );
  }
}
