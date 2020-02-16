import 'package:circles/widgets/media_upload.dart';
import 'package:flutter/material.dart';

class AddPost extends StatelessWidget {
  final postTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(height: 100),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: TextFormField(
              maxLines: 8,
              decoration: InputDecoration(
                labelText: 'Add your thoughts',
              ),
            ),
          ),
          Container(
            height: 25,
          ),
          MediaUpload(),
          Container(
            height: 25,
          ),
          Container(
            height: 50,
            child: Align(
              alignment: Alignment(0.75, 0.50),
              child: FloatingActionButton(
                onPressed: () {},
                tooltip: 'publish',
                child: Icon(Icons.send),

              ),
            ),
          ),
          Container(
            height: 35,
          ),
        ],
      ),
    );
  }
}
