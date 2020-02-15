import 'dart:convert';

import 'package:circles/widgets/wall_of_posts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignInPage extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    logInHandler() {
      var url = 'http://192.168.0.10:1337/parse/classes/Circle_Session';
      var body = {
        "sessionToken": "r:d384a315072e27681be40694bb66cc8a",
        "user": {
          "__type": "Pointer",
          "className": "InstagramTemplate2__User",
          "objectId": "OldqukfDjN"
        },
        "createdWith": {"action": "signup", "authProvider": "password"},
        "restricted": false,
        "installationId": "d3810ba2-294b-4f75-b3ba-6f674fced303",
        "expiresAt": {"__type": "Date", "iso": "2020-03-04T07:45:23.040Z"}
      };
      http
          .post(
        url,
        headers: {
          'X-Parse-Application-Id': 'myAppId',
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
        MaterialPageRoute(builder: (context) => WallOfPosts()),
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
