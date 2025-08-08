import 'package:ethio_fm_radio/Screens/Saved/saved_page_news_card.dart';
import 'package:ethio_fm_radio/Screens/main/bottom_navigation.dart';
import 'package:ethio_fm_radio/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

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
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(AppLocalizations.of(context)!.saved_page_title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (contex) => SavedPageNewsCard(
                          title: AppLocalizations.of(context)!.saved_page_title,
                          index: 0,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 70.w,
                            height: 70.h,
                            child: Image.asset(
                              "assets/images/girl.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 70.w,
                            height: 70.h,
                            child: Image.asset(
                              "assets/images/girl2.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 70.w,
                            height: 70.h,
                            child: Image.asset(
                              "assets/images/man.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 70.w,
                            height: 70.h,
                            child: Image.asset(
                              "assets/images/man2.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
