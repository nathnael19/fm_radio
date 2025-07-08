import 'package:ethio_fm_radio/Download/components/list_of_downloads.dart';
import 'package:ethio_fm_radio/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});

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
        title: Text("የወረዱ", style: GoogleFonts.notoSansEthiopic()),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListOfDownloads(
                  icon: Icons.more_vert,
                  title: "የትም? (Yetim?)",
                  imageUrl: "assets/images/girl3.png",
                  length: "1hr 30 min",
                  other: "16+",
                  year: "2025",
                  color: Color(0xff1A0101),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
