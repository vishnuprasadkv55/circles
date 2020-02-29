import 'package:circles/widgets/card_types/card_expanded.dart';
import 'package:flutter/material.dart';

class TextOnly extends StatelessWidget {
  final postIndex;
  final post;
  TextOnly(this.postIndex, this.post);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
          child: Hero(
            tag: 'postHero' + postIndex.toString(),
            child: Material(
              child: Container(
                margin: EdgeInsets.fromLTRB(60, 0, 10, 0),
                child: Text(
                  post,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return CardExpanded(post, postIndex);
            }));
          }),
    );
  }
}
