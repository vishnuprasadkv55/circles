import 'package:circles/widgets/add_post.dart';
import 'package:circles/widgets/message_screen/message_ui.dart';
import 'package:circles/widgets/profile_page.dart';
import 'package:circles/widgets/wall_of_posts.dart';
import 'package:flutter/material.dart';
import 'package:circles/widgets/nav_bar.dart';

import 'message_screen/chat_screen.dart';

class LogInHome extends StatefulWidget {
  @override
  _LogInHomeState createState() => _LogInHomeState();
}

class _LogInHomeState extends State<LogInHome> {
  bool _navBarVisibility = true;
  PageController _pageController;
  int _currentIndex = 0;
  favCallback() {
    this.setState(() {
      _currentIndex = 0;
      _pageController.jumpToPage(_currentIndex);
    });
  }

  showNavBar() {
    setState(() {
      _navBarVisibility = true;
    });
  }

  hideNavBar() {
    setState(() {
      _navBarVisibility = false;
    });
  }

  AddPost addPost;
  @override
  void initState() {
    super.initState();
    _navBarVisibility = true;
    addPost = new AddPost(favCallback);
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
      bottomNavigationBar: Visibility(
        visible: _navBarVisibility,
        child: NavBar(
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
            NavBarItem(
              title: Text('Profile'),
              icon: Icon(Icons.face),
            ),
          ],
        ),
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
              child: addPost,
            ),
            Container(
              child: NotificationListener<HideNavBar>(
                  onNotification: (value) {
                    print(value.hideNav);
                    value.hideNav ? showNavBar() : hideNavBar();
                    return true;
                  },
                  child: MessageUi()),
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
