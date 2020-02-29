import 'package:circles/models/message_model.dart';
import 'package:circles/widgets/message_screen/category_selector.dart';
import 'package:circles/widgets/message_screen/favourite_contacts.dart';
import 'package:circles/widgets/message_screen/recent_chats.dart';
import 'package:flutter/material.dart';

class ChatHome extends StatefulWidget {
  @override
  _ChatHomeState createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  var selectedIndex = 0;
  setSelectedIndex(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  getChatTab() {
    switch (selectedIndex) {
      case 0:
        {
          return Column(
            children: <Widget>[
              FavouriteContacts(),
              RecentChats(),
            ],
          );
        }
      case 1:
        {
          return Text('data');
        }
      case 2:
        {
          return Text('data2');
        }
      case 3:
        {
          return Text('data3');
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
          color: Colors.white,
          iconSize: 30.0,
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
            color: Colors.white,
            iconSize: 30.0,
          ),
        ],
        title: Text(
          'Chats',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          CategorySelector(
            changeTab: setSelectedIndex,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: getChatTab(),
            ),
          ),
        ],
      ),
    );
  }
}
