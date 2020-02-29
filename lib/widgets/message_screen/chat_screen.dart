import 'package:circles/models/message_model.dart';
import 'package:circles/models/user_model.dart';
import 'package:flutter/material.dart';

class HideNavBar extends Notification {
  final bool hideNav;

  HideNavBar({this.hideNav});
}

class ChatScreen extends StatefulWidget {
  final UserModel user;
  ChatScreen({this.user});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
        (_) => HideNavBar(hideNav: false)..dispatch(context));
  }

  _buildMessageComposer() {
    return Container(
      height: 70.0,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.image,
            ),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              decoration:
                  InputDecoration.collapsed(hintText: 'send a message...'),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.send,
            ),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          )
        ],
      ),
    );
  }

  _buildMessage(MessageModel message, bool isMe) {
    final Container msg = Container(
      width: MediaQuery.of(context).size.width * 0.75,
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      decoration: BoxDecoration(
        color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
        borderRadius: isMe
            ? BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              )
            : BorderRadius.only(
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
      ),
      margin: isMe
          ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0)
          : EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.time,
            style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            message.text,
            style: TextStyle(
              color: Colors.blueGrey,
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: <Widget>[
        msg,
        IconButton(
          icon: message.isLiked
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border),
          iconSize: 30.0,
          color:
              message.isLiked ? Theme.of(context).primaryColor : Colors.black,
          onPressed: () {},
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            HideNavBar(hideNav: true)..dispatch(context);
            Navigator.pop(context);
          },
          color: Colors.white,
          iconSize: 30.0,
        ),
        elevation: 0.0,
        title: Text(
          widget.user.name,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(top: 15.0),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, index) {
                      final MessageModel message = messages[index];
                      final bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message, isMe);
                    },
                  ),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
