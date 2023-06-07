import 'package:flutter/material.dart';
import 'package:micasa/helpers/constants.dart';
import 'package:micasa/pages/main/activity_page.dart';
import 'package:micasa/pages/main/explore_page.dart';
import 'package:micasa/pages/main/home_page.dart';
import 'package:micasa/pages/main/inbox_page.dart';
import 'package:micasa/pages/main/profile_page.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ExplorePage(),
    ActivityPage(),
    InboxPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: kPrimaryColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        iconSize: kIconSize,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
