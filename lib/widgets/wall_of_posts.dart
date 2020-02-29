import 'dart:convert';

import 'package:circles/widgets/post_card.dart';
import 'package:circles/widgets/post_category_selector.dart';
import 'package:circles/widgets/user_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:circles/widgets/shared_pref.dart';

class WallOfPosts extends StatefulWidget {
  @override
  _WallOfPostsState createState() => _WallOfPostsState();
}

class _WallOfPostsState extends State<WallOfPosts> {
  _WallOfPostsState() {
    getPosts();
    print('wall constructed');
  }
  List postLists = [];
  final SharedPref sharedPref = SharedPref();

  getPosts() async {
    try {
      var userDetails;
      var userDetailsObj = jsonEncode(await sharedPref.read('user'));
      User user = new User(
          token: jsonDecode(userDetailsObj)['token'],
          userDetails: jsonDecode(userDetailsObj)['userDetails']);
      print(user.token);
      userDetails = jsonDecode(user.userDetails);
      var url = 'http://192.168.0.14:3000/getPosts';
      http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'x-access-token': user.token,
        },
      ).then((response) {
        print('hello');
        setState(() {
          postLists = jsonDecode(response.body);
        });
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: SizedBox(),
        elevation: 0.0,
        title: Text('Posts'),
      ),
      body: Column(
        children: <Widget>[
          PostCategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.0),
                  topLeft: Radius.circular(30.0),
                ),
                child: ListView.builder(
                  itemCount: postLists.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: PostCard('T', index, postLists[index]['text']),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
