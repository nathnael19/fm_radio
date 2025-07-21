import 'package:ethio_fm_radio/Screens/Home/News/comment_bottom_sheet.dart';
import 'package:ethio_fm_radio/Screens/Home/News/news_detail_card.dart';
import 'package:ethio_fm_radio/Screens/constants/bottomsheettop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({super.key});

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
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
            title: "በጋምቤላ ክልል በግንባታ ማእድን ላይ የተጋነነ የዋጋ ጭማሪ እየታየ ነዉ ተባለ ።",
            subtitle: """የግንባታ ማእድናቱን የዋጋ ተመን ማስተካከያ እየተደረገበት መሆኑንም ሰምተናል።
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
      ),
    );
  }
}
