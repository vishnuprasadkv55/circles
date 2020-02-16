import 'package:circles/widgets/add_post.dart';
import 'package:circles/widgets/media_upload.dart';
import 'package:circles/widgets/profile_page.dart';
import 'package:circles/widgets/wall_of_posts.dart';
import 'package:flutter/material.dart';
import 'package:circles/widgets/nav_bar.dart';

class LogInHome extends StatefulWidget {
  @override
  _LogInHomeState createState() => _LogInHomeState();
}

class _LogInHomeState extends State<LogInHome> {
  PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <NavBarItem>[
          NavBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home),
          ),
          NavBarItem(
            title: Text('Notifications'),
            icon: Icon(Icons.notifications),
          ),
          NavBarItem(
            title: Text('Share'),
            icon: Icon(Icons.add_circle),
          ),
          NavBarItem(
            title: Text('Messages'),
            icon: Icon(Icons.message),
          ),
          NavBarItem(title: Text('Profile'), icon: Icon(Icons.face)),
        ],
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Container(
              child: WallOfPosts(),
            ),
            Container(
              color: Colors.blue,
            ),
            Container(
              child: AddPost(),
            ),
            
            Container(
              color: Colors.grey,
            ),
            Container(
              child: ProfilePage(),
            ),
          ],
        ),
      ),
    );
  }
}
