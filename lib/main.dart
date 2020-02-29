import 'package:circles/widgets/sign_up_page.dart';
import 'package:circles/widgets/tab_log_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  TabController _tabController;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              // SignUpPage()
              TabLogScreen()
            ],
          ),
        ),
      ),
    );
  }
}
