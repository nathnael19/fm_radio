import 'package:ethio_fm_radio/Screens/Home/News/comment_bottom_sheet.dart';
import 'package:ethio_fm_radio/Screens/Home/Live/components/side_container_icons.dart';
import 'package:flutter/material.dart';

class SideContainer extends StatelessWidget {
  const SideContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    double heightPercent(double h) => h * screenHeight / 844;
    double widthPercent(double w) => w * screenWidth / 390;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: widthPercent(5),
        vertical: heightPercent(2),
      ),
      width: widthPercent(56),
      height: heightPercent(256),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(widthPercent(55)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SideContainerIcon(
            icon: Icons.thumb_up_off_alt,
            number: 400,
            onTap: () {},
          ),
          SideContainerIcon(
            icon: Icons.messenger_outline,
            number: 400,
            onTap: () {
              _showBottomSheet(context, widthPercent, heightPercent);
            },
          ),
          SideContainerIcon(icon: Icons.send, number: 400, onTap: () {}),
          SideContainerIcon(
            icon: Icons.bookmark_outline_rounded,
            number: 400,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(
    BuildContext context,
    double Function(double) wp,
    double Function(double) hp,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.8,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              children: [
                // Drag handle
                Container(
                  width: wp(60),
                  height: hp(5),
                  margin: EdgeInsets.only(
                    top: hp(8),
                    bottom: hp(12),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(wp(10)),
                  ),
                ),
                // Comments section
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CommentBottomSheet(
                          comments: [],
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                // Input area
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: wp(12),
                    vertical: hp(8),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    border: Border(
                      top: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Write a comment...",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(wp(20)),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: wp(16),
                              vertical: hp(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: wp(8)),
                      IconButton(
                        icon: const Icon(Icons.send, color: Colors.blueAccent),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
