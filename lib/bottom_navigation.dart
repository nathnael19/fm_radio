import 'package:flutter/material.dart';
import 'package:ethio_fm_radio/Screens/Download/download_page.dart';
import 'package:ethio_fm_radio/Screens/Group/group_page.dart';
import 'package:ethio_fm_radio/Screens/Home/Live/home_page.dart';
import 'package:ethio_fm_radio/Screens/Profile/profile_page.dart';
import 'package:ethio_fm_radio/Screens/Saved/saved_page.dart';

class MyBottomNavigation extends StatefulWidget {
  final int pageIndex;
  const MyBottomNavigation({super.key, this.pageIndex = 0});

  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  int _selectedIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = List.generate(
    5,
    (_) => GlobalKey<NavigatorState>(),
  );

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.pageIndex;
  }

  Future<bool> _onWillPop() async {
    final NavigatorState currentTabNav =
        _navigatorKeys[_selectedIndex].currentState!;
    if (currentTabNav.canPop()) {
      currentTabNav.pop();
      return false;
    }
    return true;
  }

  Widget _buildOffstageNavigator(int index, Widget child) {
    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (_) => child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            _buildOffstageNavigator(0, const HomePage()),
            _buildOffstageNavigator(1, const GroupPage()),
            _buildOffstageNavigator(2, const DownloadPage()),
            _buildOffstageNavigator(3, const SavedPage()),
            _buildOffstageNavigator(4, const ProfilePage()),
          ],
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: const BoxDecoration(color: Color(0xff1A0101)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(_navigatorKeys.length, (index) {
              bool isSelected = _selectedIndex == index;
              final icon = [
                Icons.home,
                Icons.group_outlined,
                Icons.file_download_outlined,
                Icons.bookmark,
                Icons.person_outline,
              ][index];

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
                    icon,
                    color: isSelected ? const Color(0xff4A0000) : Colors.white,
                    size: 28,
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
