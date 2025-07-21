import 'package:ethio_fm_radio/Screens/Home/News/news_card.dart';
import 'package:ethio_fm_radio/Screens/Saved/saved_page.dart';
import 'package:ethio_fm_radio/bottom_navigation.dart';
import 'package:ethio_fm_radio/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SavedPageNewsCard extends StatefulWidget {
  const SavedPageNewsCard({super.key});

  @override
  State<SavedPageNewsCard> createState() => _SavedPageNewsCardState();
}

class _SavedPageNewsCardState extends State<SavedPageNewsCard> {
  bool isPlaying = false;

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
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return NewsCard(
                  date: "Apr 2, 2025",
                  channel: "Ethio FM",
                  imageUrl: "assets/images/gambela.png",
                  title: "2 ሺህ መካከለኛ ደረጃ የስፖርት ማዘውተሪያ ስፍራዎች ተገንብተዋል ተባለ",
                  subtitle:
                      "አዲስ አበባ፣ ሚያዝያ 7፣ 2017 (ኤፍ ኤም ሲ) በ25ኛ ሣምንት የኢትዮጵያ ፕሪሚየር ሊግ ጨዋታ ኢትዮጵያ ቡና ፋሲል ከነማን 1 ለ 0 በሆነ ውጤት አሸንፏል፡፡ የኢትዮጵያ ቡናን ብቸኛ የማሸነፊያ ግብ ኮንኮኒ ሀፊዝ በመጀመሪያው አጋማሽ ከመረብ አሳርፏል፡፡ ኢትዮጵያ ቡና ወደ ድል ሲመለስ ፋሲል ከነማ ከሦስት ተከታታይ ጨዋታ ድል በኋላ ሽንፈት አስተናግዷል፡፡ ውጤቱን…",
                  likes: 400,
                  comments: 20,
                  shares: 4,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
