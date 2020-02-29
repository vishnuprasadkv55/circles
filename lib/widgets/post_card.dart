import 'package:circles/widgets/card_types/card_expanded.dart';
import 'package:circles/widgets/card_types/text_only.dart';
import 'package:circles/widgets/post_footer.dart';
import 'package:circles/widgets/post_header.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final postType;
  final postIndex;
  final post;
  PostCard(this.postType, this.postIndex,this.post);
  @override
  Widget build(BuildContext context) {
    getCardType() {
      switch (postType) {
        case 'T':
          {
            return TextOnly(postIndex,post);
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
            child: Column(
          children: <Widget>[
            InkWell(
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
                      return CardExpanded(post,postIndex);
                    }),
                  );
                }),
            PostFooter()
          ],
        )),
      ),
    );
  }
}


