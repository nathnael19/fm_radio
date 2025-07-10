import 'package:ethio_fm_radio/Home/News/comment_bottom_sheet.dart';
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
        child: Column(
          children: [
            // Drag Handle
            Container(
              width: 60.w,
              height: 5.h,
              margin: EdgeInsets.only(bottom: 12.h),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),

            // Header
            SizedBox(
              height: 60.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 16.r, color: Colors.grey),
                      SizedBox(width: 5.w),
                      Text(
                        "2hr ago",
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                      ),
                      SizedBox(width: 10.w),
                      Icon(Icons.radio, size: 16.r, color: Colors.grey),
                      SizedBox(width: 5),
                      Text(
                        "Ethio FM",
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/soundwave.png", height: 30.h),
                      SizedBox(width: 10.w),
                      Icon(
                        Icons.pause_circle_filled,
                        size: 35.r,
                        color: Colors.black87,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // News Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image
                    Container(
                      height: 200.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/taa.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Title
                    Text(
                      "በጋምቤላ ክልል በግንባታ ማእድን ላይ የተጋነነ የዋጋ ጭማሪ እየታየ ነዉ ተባለ ።",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: Colors.black,
                        height: 1.4.h,
                      ),
                    ),
                    SizedBox(height: 12.h),

                    // Body Text
                    Text(
                      """የግንባታ ማእድናቱን የዋጋ ተመን ማስተካከያ እየተደረገበት መሆኑንም ሰምተናል።
    ከ2015 አመት ጀምሮ በጋምቤላ ክልል ሁሉም ወረዳዎች ላይ የግንባታ ማእድናት ከፍተኛ ዋጋ እየተጠየቀባቸዉ ነዉ ተብሏል።
    
    ለዋጋ ጭማሪዉ ምክንያት ሆኗል የተባለዉ የነዳጅ ዋጋ መጨመር እንደሆነ የክልሉ የማእድን ሀብት ልማት ቢሮ ገልፆል።
    
    በቢሮዉ ሀላፊ የሆኑት አቶ ኡጅሉ ጊሎ ይህንን የማእድናቱ የተጋነነ የዋጋ ጭማሪ ተከትሎ አቤቱታ መቅረቡን ገልፀዋል።
    
    የዋጋ ንረቱን ለመቆጣጠር እንዲቻል ጥረት እየተደረገ ነዉ ÷ በተጋነነ ዋጋ ሲሸጥ የነበረዉን የማእድናቱን ዋጋ ማስተካከያ አድርገናል ብለዋል ሀላፊዉ። በዚህም በኬላዎች ይጣል የነበረዉን የቀረጥ እና ኮቴ ዋጋ ማስተካከያ እንደተደረገ ቢሮዉ ማሳወቁን ከክልሉ የተገኘዉ መረጃ አመላክቷል። ምክንያታዊ ያልሆነ የዋጋ ጭማሪ እንዳይኖር እና ማስተካከያ በተደረገበት የዋጋ ተመን እንዲሸጥ ማሳሰቢያ መሰጠቱን ገልፆል።
    
    ቢሮዉ የዋጋ ማሻሻያዉ ያደረኩት ይመለከታቸዋል ከተባሉ የባለድርሻ አካላት ጋር ባደረጉት ንግግር ነዉ ብሏል።
    
    ቁምነገር አየለ
    ሚያዚያ 7 ቀን 2017 ዓ.ም""",
                      style: TextStyle(
                        fontSize: 14.sp,
                        height: 1.5.h,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    showCommentSection(context),
                  ],
                ),
              ),
            ),

            SizedBox(height: 12.h),

            // Footer: Likes, Comments, Share
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey.shade300)),
              ),
              child: Column(
                children: [
                  // Interaction Buttons
                  Row(
                    children: [
                      Text("400", style: TextStyle(fontSize: 13.sp)),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.thumb_up_alt_outlined,
                          size: 20.r,
                          color: Colors.grey,
                        ),
                      ),

                      SizedBox(width: 10.w),
                      Text("400", style: TextStyle(fontSize: 13.sp)),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible = true;
                          });
                        },
                        icon: Icon(
                          Icons.comment_outlined,
                          size: 20.r,
                          color: Colors.grey,
                        ),
                      ),

                      SizedBox(width: 16.w),
                      Text("4", style: TextStyle(fontSize: 13.sp)),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.send_outlined,
                          size: 20.r,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),

                  // Comment Field
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 12.w,
                      ),
                      hintText: "Write a comment...",
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.send, color: Colors.grey),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget showCommentSection(BuildContext context) {
    if (isVisible) {
      return CommentBottomSheet(
        onTap: () {
          setState(() {
            isVisible = false;
          });
        },
      );
    } else {
      return SizedBox(height: 1.h);
    }
  }
}
