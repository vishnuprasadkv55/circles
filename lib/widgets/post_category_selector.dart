import 'package:flutter/material.dart';

class PostCategorySelector extends StatefulWidget {
  @override
  _PostCategorySelectorState createState() => _PostCategorySelectorState();
}

class _PostCategorySelectorState extends State<PostCategorySelector> {
  final List<String> postCategories = ['Circle', 'Wall', 'Notices'];
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        height: 90.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Circle',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'Wall',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              'Notices',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ));
  }
}
