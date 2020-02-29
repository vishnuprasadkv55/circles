import 'dart:convert';

import 'package:circles/widgets/log_in_home.dart';
import 'package:circles/widgets/media_upload.dart';
import 'package:circles/widgets/shared_pref.dart';
import 'package:circles/widgets/user_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddPost extends StatelessWidget {
  final postTextController = TextEditingController();
  final SharedPref sharedPref = SharedPref();
  Function favCallback;
  AddPost(this.favCallback);
  @override
  Widget build(BuildContext context) {
    sharePost() async {
      try {
        var userDetails;
        var userDetailsObj = jsonEncode(await sharedPref.read('user'));
        User user = new User(
            token: jsonDecode(userDetailsObj)['token'],
            userDetails: jsonDecode(userDetailsObj)['userDetails']);
        print(user.token);
        userDetails = jsonDecode(user.userDetails);
        var url = 'http://192.168.0.14:3000/addPost';

        var body = {
          "bookmarkedBy": [],
          "canComment": true,
          "comments": 0,
          "image": {
            "__type": "File",
            "name": "2ddc25e8d52d4647663b2bd1828f2359_image.jpg",
            "url": "https:"
          },
          "keywords": [],
          "likedBy": ["user_1"],
          "likes": 1,
          "reportedBy": [],
          "tags": ["#nyme"],
          "text": postTextController.text,
          "username": userDetails['username']
        };
        http
            .post(
          url,
          headers: {
            'Content-Type': 'application/json',
            'x-access-token': user.token,
          },
          body: jsonEncode(body),
        )
            .then((response) {
          print('postef');
        });
        this.favCallback();
      } catch (e) {}
    }

    return SingleChildScrollView(
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: TextFormField(
                controller: postTextController,
                maxLines: 8,
                decoration: InputDecoration(
                  labelText: 'Add your thoughts',
                ),
              ),
            ),
            Container(
              height: 25,
            ),
            MediaUpload(),
            Container(
              height: 25,
            ),
            Container(
              height: 50,
              child: Align(
                alignment: Alignment(0.75, 0.50),
                child: FloatingActionButton(
                  onPressed: sharePost,
                  tooltip: 'publish',
                  child: Icon(Icons.send),
                ),
              ),
            ),
            Container(
              height: 35,
            ),
          ],
        ),
      ),
    );
  }
}
