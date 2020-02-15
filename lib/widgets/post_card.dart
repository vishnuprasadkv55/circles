import 'package:circles/widgets/card_types/text_only.dart';
import 'package:circles/widgets/post_header.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final postType;
  PostCard(this.postType);
  @override
  Widget build(BuildContext context) {
    getCardType() {
      switch (postType) {
        case 'T':
          {
            return TextOnly();
          }
          break;
        case 'TP':
          {
            return Text('hello1');
          }
          break;
        case 'TV':
          {
            return Text('hello2');
          }
          break;
      }
      return Text('unIdentified');
    }

    return Container(
      child: Card(
        child: InkWell(
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 25),
            child: Column(
              children: <Widget>[
                PostHeader(),
                getCardType()
              ],),
          ),
        ),
      ),
    );
  }
}
