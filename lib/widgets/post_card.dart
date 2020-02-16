import 'package:circles/widgets/card_types/card_expanded.dart';
import 'package:circles/widgets/card_types/text_only.dart';
import 'package:circles/widgets/post_header.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final postType;
  final postIndex;
  PostCard(this.postType, this.postIndex);
  @override
  Widget build(BuildContext context) {
    getCardType() {
      switch (postType) {
        case 'T':
          {
            return TextOnly(postIndex);
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

    return Material(
          child: Container(
        child: Card(
          child: InkWell(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 25),
                child: Column(
                  children: <Widget>[
                    PostHeader('round'),
                    getCardType(),
                  ],
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) {
                    return CardExpanded();
                  }),
                );
              }),
        ),
      ),
    );
  }
}
