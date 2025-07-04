import 'package:ethio_fm_radio/Download/download_page.dart';
import 'package:ethio_fm_radio/Group/group_page.dart';
import 'package:ethio_fm_radio/Home/Live/home_page.dart';
import 'package:ethio_fm_radio/Profile/profile_page.dart';
import 'package:ethio_fm_radio/Saved/saved_page.dart';
import 'package:flutter/material.dart';

class MyBottomNavigation extends StatefulWidget {
  const MyBottomNavigation({super.key});

  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  int _selectedIndex = 0;

  final List<IconData> _icons = [
    Icons.home,
    Icons.group_outlined,
    Icons.file_download_outlined,
    Icons.bookmark,
    Icons.person_outline,
  ];

  List pages = [
    HomePage(),
    GroupPage(),
    DownloadPage(),
    SavedPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(color: Color(0xff1A0101)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(_icons.length, (index) {
            bool isSelected = _selectedIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 250),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _icons[index],
                  color: isSelected ? Color(0xff4A0000) : Colors.white,
                  size: 28,
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
