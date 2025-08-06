import 'package:ethio_fm_radio/Screens/Download/download_page.dart';
import 'package:ethio_fm_radio/Screens/Group/group_page.dart';
import 'package:ethio_fm_radio/Screens/Home/Live/home_page.dart';
import 'package:ethio_fm_radio/Screens/Profile/profile_page.dart';
import 'package:ethio_fm_radio/Screens/Saved/saved_page.dart';
import 'package:flutter/material.dart';

final List<IconData> bottomIcons = [
  Icons.home,
  Icons.group_outlined,
  Icons.file_download_outlined,
  Icons.bookmark,
  Icons.person_outline,
];

final List<Widget> bottomPages = [
  const HomePage(),
  const GroupPage(),
  const DownloadPage(),
  const SavedPage(),
  const ProfilePage(),
];
