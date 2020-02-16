import 'package:circles/widgets/card_types/card_expanded.dart';
import 'package:flutter/material.dart';

class TextOnly extends StatelessWidget {
  final postIndex;
  TextOnly(this.postIndex);
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
                    'This will show the text on the screen using the default text for the OS. Roboto on Android and Helvetiva Neue on iOS. Let’s start playing around. Create a build method like this so you can see what’s happening with all the changes.'),
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return CardExpanded();
            }));
          }),
    );
  }
}
