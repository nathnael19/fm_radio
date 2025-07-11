import 'package:ethio_fm_radio/Download/components/list_of_downloads.dart';
import 'package:ethio_fm_radio/bottom_navigation.dart';
import 'package:ethio_fm_radio/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
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
        title: Text(
          local.donwload_page_title,
          style: GoogleFonts.notoSansEthiopic(),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListOfDownloads(
                  onTap: () {
                    // 🟢 Show BottomSheet when delete button tapped
                    showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      backgroundColor: Colors.white,
                      builder: (context) {
                        return SizedBox(
                          height: 105.h,
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              Container(
                                width: 50,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              const SizedBox(height: 20),
                              ListTile(
                                leading: const Icon(
                                  Icons.delete_outline,
                                  color: Colors.black,
                                ),
                                title: Text(
                                  local.donwload_page_delete_item,
                                  style: GoogleFonts.notoSansEthiopic(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(local.deleted_item_message),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  icon: Icons.more_vert,
                  title: "የትም? (Yetim?)",
                  imageUrl: "assets/images/girl3.png",
                  length: "1hr 30 min",
                  other: "16+",
                  year: "2025",
                  color: const Color(0xff1A0101),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
