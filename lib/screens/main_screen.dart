import 'package:chatflut/screens/chat_list_screen.dart';
import 'package:chatflut/screens/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    PostScreen(),
    const ChatListScreen(),
    ScreenTwo(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Flutter Bottom Navigation'),
      // ),
      body: _screens[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: 50.0,
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.chat_bubble, size: 30),
          Icon(Icons.person, size: 30),
        ],
        color: Colors.green,
        buttonBackgroundColor: Colors.greenAccent,
        backgroundColor: Colors.green,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}


class ScreenTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent, // Status bar transparan
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.green],
            ),
          ),
          child: Center(
            child: Text(
              'Profile Screen',
              style: TextStyle(color: Colors.white, fontSize: 24.0),
            ),
          ),
        ),
      ),
    );
  }
}
