import 'package:ethio_fm_radio/Screens/Download/download_page.dart';
import 'package:ethio_fm_radio/Screens/Group/group_page.dart';
import 'package:ethio_fm_radio/Screens/Home/Live/home_page.dart';
import 'package:ethio_fm_radio/Screens/Profile/profile_page.dart';
import 'package:ethio_fm_radio/Screens/Saved/saved_page.dart';
import 'package:flutter/material.dart';

class MyBottomNavigation extends StatefulWidget {
  final void Function(Locale)? onLocaleChange; // ✅ Add locale change callback

  const MyBottomNavigation({super.key, this.onLocaleChange});

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

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomePage(),
      const GroupPage(),
      const DownloadPage(),
      const SavedPage(),
      const ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: const BoxDecoration(color: Color(0xff1A0101)),
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
                duration: const Duration(milliseconds: 250),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _icons[index],
                  color: isSelected ? const Color(0xff4A0000) : Colors.white,
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
