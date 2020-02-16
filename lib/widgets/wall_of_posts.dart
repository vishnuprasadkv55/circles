import 'package:circles/widgets/post_card.dart';
import 'package:flutter/material.dart';

class WallOfPosts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(5, 20, 5, 10),
        child: ListView(
          children: <Widget>[
            PostCard('T',1)
          ],
        ),
      ),
    );
  }
}