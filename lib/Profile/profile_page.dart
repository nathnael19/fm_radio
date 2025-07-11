import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ethio_fm_radio/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  final void Function(Locale)? onLocaleChange;

  const ProfilePage({super.key, this.onLocaleChange});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _switchValue = false;
  String _selectedLanguage = "አማርኛ";
  bool _showLanguageOptions = false;

  @override
  void initState() {
    super.initState();
    _loadSavedLanguage();
  }

  Future<void> _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    String? lang = prefs.getString('selectedLanguage');
    setState(() {
      _selectedLanguage = (lang == 'en') ? 'English' : 'አማርኛ';
    });
  }

  Future<void> _saveLanguage(String langCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedLanguage', langCode);
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(local.profile_page_title), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Notifications toggle
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(local.profile_page_notification),
              trailing: CupertinoSwitch(
                activeTrackColor: const Color(0xff80011F),
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
                title: Text(local.profile_page_language),
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

            AnimatedCrossFade(
              duration: const Duration(milliseconds: 200),
              firstChild: const SizedBox.shrink(),
              secondChild: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LanguageOption(
                      label: local.english,
                      onTap: () async {
                        setState(() {
                          _selectedLanguage = local.english;
                          _showLanguageOptions = false;
                        });
                        await _saveLanguage('en');
                        widget.onLocaleChange?.call(const Locale('en'));
                      },
                    ),
                    LanguageOption(
                      label: local.amhric,
                      onTap: () async {
                        setState(() {
                          _selectedLanguage = local.amhric;
                          _showLanguageOptions = false;
                        });
                        await _saveLanguage('am');
                        widget.onLocaleChange?.call(const Locale('am'));
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

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                local.profile_page_about,
                style: const TextStyle(fontSize: 18),
              ),
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
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
    );
  }
}
