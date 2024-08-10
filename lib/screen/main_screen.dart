import 'package:app_aaun/screen/home/edit_screen.dart';
import 'package:app_aaun/screen/home/home_Screen.dart';
import 'package:app_aaun/screen/home/profile_screen.dart';
import 'package:app_aaun/screen/home/setting_screen.dart';
import 'package:flutter/material.dart';

class BottomMenu {
  String title;
  String icon;
  Widget screen;
  BottomMenu({required this.title, required this.icon, required this.screen});
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List<BottomMenu> items = [
    BottomMenu(title: 'Home', icon: 'home', screen: HomeScreen()),
    BottomMenu(title: 'Settings', icon: 'settings', screen: SettingScreen()),
    BottomMenu(title: 'Profile', icon: 'profile', screen: ProfileScreen()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(items[_selectedIndex].title),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.home),
        ),
        backgroundColor: Colors.blue.shade100,
      ),
      body: (items[_selectedIndex].screen),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: items
            .map((menu) => BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: menu.title,
                ))
            .toList(),
      ),
    );
  }
}
