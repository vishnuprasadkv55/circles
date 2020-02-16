import 'package:flutter/material.dart';
import 'package:circles/widgets/avatar_holder.dart';

class PostHeader extends StatelessWidget {
  final size;
  PostHeader(this.size);
  @override
  Widget build(BuildContext context) {
    return Row(
              children: <Widget>[
                AvatarHolder(size),
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