import 'package:flutter/material.dart';
import 'package:circles/widgets/avatar_holder.dart';

class PostHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
              children: <Widget>[
                AvatarHolder(),
                Container(
                  margin: EdgeInsets.fromLTRB(12, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'vishnu',
                        style: TextStyle(fontSize: 18.0),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'Today at 2:30 AM',
                        style: TextStyle(color: Colors.grey),)
                    ],
                  ),
                )
              ],
            );
  }
}