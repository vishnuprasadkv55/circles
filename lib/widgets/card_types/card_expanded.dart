import 'package:circles/widgets/post_header.dart';
import 'package:flutter/material.dart';

class CardExpanded extends StatelessWidget {
  final post;
  final postIndex;
  CardExpanded(this.post, this.postIndex);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Material(
        child: Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Card(
              child: InkWell(
                child: Hero(
                  tag: 'postHero' + postIndex.toString(),
                  child: Container(
                    height: 500,
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    child: Material(
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            PostHeader('expanded'),
                            Text(
                              post,
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
      ),
    );
  }
}
