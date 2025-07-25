import 'package:ethio_fm_radio/Screens/Auth/signin_page.dart';
import 'package:ethio_fm_radio/cubit/notification/notification_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ethio_fm_radio/l10n/app_localizations.dart';
import 'package:ethio_fm_radio/cubit/language/language_cubit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _selectedLanguage = "አማርኛ";
  bool _showLanguageOptions = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final currentLocale = context.read<LanguageCubit>().state;
    setState(() {
      _selectedLanguage =
          currentLocale.languageCode == 'en' ? 'English' : 'አማርኛ';
    });
  }

  Future<void> _handleNotificationToggle(bool value) async {
    final notificationCubit = context.read<NotificationCubit>();

    if (value == true) {
      final shouldEnable = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Allow Notifications'),
          content: const Text(
            'Do you want to allow this app to send you notifications?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Allow'),
            ),
          ],
        ),
      );

      if (shouldEnable == true) {
        notificationCubit.toggleNotification();
      }
    } else {
      notificationCubit.toggleNotification();
    }
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context); // ✅ FIXED to avoid duplicating bottom nav
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
        ),
        title: Text(local.profile_page_title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<NotificationCubit, bool>(
              builder: (context, state) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(local.profile_page_notification),
                  trailing: CupertinoSwitch(
                    activeTrackColor: const Color(0xff80011F),
                    value: state,
                    onChanged: _handleNotificationToggle,
                  ),
                );
              },
            ),
            const Divider(indent: 5, endIndent: 5),

            /// Language dropdown
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
                      onTap: () {
                        context.read<LanguageCubit>().setLocale(
                              const Locale('en'),
                            );
                        setState(() {
                          _selectedLanguage = local.english;
                          _showLanguageOptions = false;
                        });
                      },
                    ),
                    LanguageOption(
                      label: local.amhric,
                      onTap: () {
                        context.read<LanguageCubit>().setLocale(
                              const Locale('am'),
                            );
                        setState(() {
                          _selectedLanguage = local.amhric;
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

            const Divider(indent: 5, endIndent: 5),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                local.profile_page_about,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const Divider(indent: 5, endIndent: 5),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => SigninPage()),
                  );
                },
                child: Text(
                  local.logout_text,
                  style: const TextStyle(fontSize: 18),
                ),
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
