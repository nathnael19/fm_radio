import 'package:ethio_fm_radio/Screens/Home/News/news_card.dart';
import 'package:ethio_fm_radio/Screens/Home/News/news_detail_card.dart';
import 'package:ethio_fm_radio/Screens/Home/News/news_detail_page.dart';
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
  bool isVisible = false;

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
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        backgroundColor: Colors.white,
                        builder: (context) {
                          return FractionallySizedBox(
                              heightFactor: 0.8,
                              child: Padding(
                                padding: EdgeInsets.all(16.0.r),
                                child: NewsDetailCard(
                                    showComments: isVisible,
                                    onMinimizeTapped: () {
                                      setState(() {
                                        isVisible = false;
                                      });
                                    },
                                    onCommentTapped: () {
                                      setState(() {
                                        isVisible = true;
                                      });
                                    },
                                    date: "2hr ago",
                                    channel: "Ethio FM",
                                    imageUrl: "assets/images/taa.png",
                                    title:
                                        "በጋምቤላ ክልል በግንባታ ማእድን ላይ የተጋነነ የዋጋ ጭማሪ እየታየ ነዉ ተባለ ።",
                                    subtitle:
                                        """የግንባታ ማእድናቱን የዋጋ ተመን ማስተካከያ እየተደረገበት መሆኑንም ሰምተናል።
  ከ2015 አመት ጀምሮ በጋምቤላ ክልል ሁሉም ወረዳዎች ላይ የግንባታ ማእድናት ከፍተኛ ዋጋ እየተጠየቀባቸዉ ነዉ ተብሏል።
  
  ለዋጋ ጭማሪዉ ምክንያት ሆኗል የተባለዉ የነዳጅ ዋጋ መጨመር እንደሆነ የክልሉ የማእድን ሀብት ልማት ቢሮ ገልፆል።
  
  በቢሮዉ ሀላፊ የሆኑት አቶ ኡጅሉ ጊሎ ይህንን የማእድናቱ የተጋነነ የዋጋ ጭማሪ ተከትሎ አቤቱታ መቅረቡን ገልፀዋል።
  
  የዋጋ ንረቱን ለመቆጣጠር እንዲቻል ጥረት እየተደረገ ነዉ ÷ በተጋነነ ዋጋ ሲሸጥ የነበረዉን የማእድናቱን ዋጋ ማስተካከያ አድርገናል ብለዋል ሀላፊዉ። በዚህም በኬላዎች ይጣል የነበረዉን የቀረጥ እና ኮቴ ዋጋ ማስተካከያ እንደተደረገ ቢሮዉ ማሳወቁን ከክልሉ የተገኘዉ መረጃ አመላክቷል። ምክንያታዊ ያልሆነ የዋጋ ጭማሪ እንዳይኖር እና ማስተካከያ በተደረገበት የዋጋ ተመን እንዲሸጥ ማሳሰቢያ መሰጠቱን ገልፆል።
  
  ቢሮዉ የዋጋ ማሻሻያዉ ያደረኩት ይመለከታቸዋል ከተባሉ የባለድርሻ አካላት ጋር ባደረጉት ንግግር ነዉ ብሏል።
  
  ቁምነገር አየለ
  ሚያዚያ 7 ቀን 2017 ዓ.ም""",
                                    likes: 400,
                                    comments: 35,
                                    shares: 5),
                              ));
                        });
                  },
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
