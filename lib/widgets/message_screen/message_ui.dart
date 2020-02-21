import 'package:circles/widgets/message_screen/chat_home.dart';
import 'package:flutter/material.dart';

class MessageUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messages',
      theme: ThemeData(
        primaryColor: Colors.red,
        accentColor: Color(0xFFFEF9EB)
      ),
      home: ChatHome()
    );
  }
}