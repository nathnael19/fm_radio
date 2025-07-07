import 'package:ethio_fm_radio/bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _switchValue = false;
  String _selectedLanguage = "English";
  bool _showLanguageOptions = false;

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
            );
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text("አካውንት"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Notifications toggle
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text("Notifications"),
              trailing: CupertinoSwitch(
                activeTrackColor: Color(0xff80011F),
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
            GestureDetector(
              onTap: () {
                setState(() {
                  _showLanguageOptions = !_showLanguageOptions;
                });
              },
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text("Language"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _selectedLanguage,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 6),
                    Icon(
                      _showLanguageOptions
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                    ),
                  ],
                ),
              ),
            ),

            // Language list
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 200),
              firstChild: const SizedBox.shrink(),
              secondChild: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LanguageOption(
                      label: "English",
                      onTap: () {
                        setState(() {
                          _selectedLanguage = "English";
                          _showLanguageOptions = false;
                        });
                      },
                    ),
                    LanguageOption(
                      label: "አማርኛ",
                      onTap: () {
                        setState(() {
                          _selectedLanguage = "አማርኛ";
                          _showLanguageOptions = false;
                        });
                      },
                    ),
                  ],
                ),
              ),
              crossFadeState: _showLanguageOptions
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
            ),

            const Divider(indent: 15, endIndent: 15),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: Text("About FM", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageOption extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const LanguageOption({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      onTap: onTap,
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
    );
  }
}
