import 'package:flutter/material.dart';

class AvatarHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 50.0,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        image: new DecorationImage(
          fit: BoxFit.fill,
          image: new NetworkImage('https://picsum.photos/200'),
        ),
      ),
    );
  }
}
