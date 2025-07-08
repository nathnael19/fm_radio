import 'package:ethio_fm_radio/Databases/live_database.dart';
import 'package:ethio_fm_radio/Home/Podcast/podcast_detail_page.dart';
import 'package:ethio_fm_radio/Home/components/recent_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PodcastPage extends StatefulWidget {
  const PodcastPage({super.key});

  @override
  State<PodcastPage> createState() => _PodcastPageState();
}

class _PodcastPageState extends State<PodcastPage> {
  List recent = recentPrograms;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top container
          Container(
            decoration: BoxDecoration(
              color: Color(0xff80011F),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
            ),
            height: 15,
          ),

          // Expanded scrollable content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(
                bottom: 10,
              ), // leave space for overlay
              child: Column(
                children: [
                  // Section 1
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("በኢትዮ ኤፍ ኤም 107.8 ብቻ"),
                        Text(
                          "ሁሉንም ክፈት",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.75,
                        ),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PodcastDetailPage(),
                            ),
                          );
                        },
                        child: RecentCard(
                          imageUrl: recent[index][0],
                          title: recent[index][1],
                          subtitle: recent[index][2],
                        ),
                      );
                    },
                  ),

                  // Section 2
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("ከአዘጋጆች"),
                        Text(
                          "ሁሉንም ክፈት",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.75,
                        ),
                    itemCount: recent.length,
                    itemBuilder: (context, index) {
                      return RecentCard(
                        imageUrl: recent[index][0],
                        title: recent[index][1],
                        subtitle: recent[index][2],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
