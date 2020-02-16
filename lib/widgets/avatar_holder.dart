import 'package:flutter/material.dart';

class AvatarHolder extends StatelessWidget {
  final size;
  AvatarHolder(this.size);
  @override
  Widget build(BuildContext context) {
    return size =='round' ? Container(
      width: 50.0,
      height: 50.0,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        image: new DecorationImage(
          fit: BoxFit.fill,
          image: new NetworkImage('https://picsum.photos/200'),
        ),
      ),
    ): Container(
      width: 80.0,
      height: 80.0,
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        image: new DecorationImage(
          fit: BoxFit.fill,
          image: new NetworkImage('https://picsum.photos/200'),
        ),
      ),
    );
  }
}
