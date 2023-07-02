import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micasa/bloc/app_bloc.dart';
import 'package:micasa/helpers/constants.dart';
import 'package:micasa/pages/main/activity_page.dart';
import 'package:micasa/pages/main/explore_page.dart';
import 'package:micasa/pages/main/home_page.dart';
import 'package:micasa/pages/main/inbox_page.dart';
import 'package:micasa/pages/main/profile_page.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ExplorePage(),
    ActivityPage(),
    InboxPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppBloc>().state;
    // print(state.tabIndex);
    return Scaffold(
      body: _widgetOptions.elementAt(state.tabIndex!),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: state.tabIndex!,
        onTap: (index) {
          //print(index);
          context.read<AppBloc>().add(
                AppEventGoToAppView(
                  tabIndex: index,
                ),
              );
        },
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
