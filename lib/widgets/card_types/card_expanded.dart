import 'package:circles/widgets/post_header.dart';
import 'package:flutter/material.dart';

class CardExpanded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Card(
            child: InkWell(
              child: Hero(
                tag: 'postHero1',
                child: Container(
                  height: 500,
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                  child: Material(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          PostHeader('expanded'),
                          Text(
                            'This will show the text on the screen using the default text for the OS. Roboto on Android and Helvetiva Neue on iOS. Let’s start playing around. Create a build method like this so you can see what’s happening with all the changes.',
                            style: TextStyle(fontSize: 18.0),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
