import 'package:ethio_fm_radio/bottom_navigation.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _switchValue = false;
  String? _selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyBottomNavigation()),
            ); // or any back logic you want
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text("አካውንት"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Notifications toggle
            ListTile(
              title: const Text("Notifications"),
              trailing: Switch(
                value: _switchValue,
                onChanged: (v) {
                  setState(() {
                    _switchValue = v;
                  });
                },
              ),
            ),
            const Divider(indent: 15, endIndent: 15),

            // Language dropdown
            ListTile(
              title: const Text("Language"),
              trailing: DropdownButton<String>(
                value: _selectedLanguage,
                hint: Text(_selectedLanguage!),
                items: const [
                  DropdownMenuItem(value: "English", child: Text("English")),
                  DropdownMenuItem(value: "አማርኛ", child: Text("አማርኛ")),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedLanguage = value;
                  });
                },
              ),
            ),
            const Divider(indent: 15, endIndent: 15),
            ListTile(title: Text("About FM", style: TextStyle(fontSize: 18))),
          ],
        ),
      ),
    );
  }
}
