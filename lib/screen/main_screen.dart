import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:pro_23/screen/home/home_screen.dart';
import 'package:pro_23/screen/post/post_list_screen.dart';
import 'package:pro_23/screen/setting/setting_screen.dart';
import 'package:pro_23/screen/user/user_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: [
          HomeScreen(),
          PostListScreenScreen(),
          UserScreen(),
          SettingScreen(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        //selectedIndex: currentIndex,
        indicatorColor: Colors.green,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'hello'.tr,
          ),
          NavigationDestination(
            icon: Icon(Icons.article_outlined),
            selectedIcon: Icon(Icons.article),
            label: 'Post',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_2_outlined),
            selectedIcon: Icon(Icons.person),
            label: 'User',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}
