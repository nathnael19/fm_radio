import 'package:ethio_fm_radio/Screens/Home/News/comment_bottom_sheet.dart';
import 'package:ethio_fm_radio/Screens/Home/Live/components/side_container_icons.dart';
import 'package:ethio_fm_radio/Screens/constants/responsive.dart';
import 'package:flutter/material.dart';

class SideContainer extends StatelessWidget {
  const SideContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getMobileWidth(context, 5),
        vertical: getMobileHeight(context, 1),
      ),
      width: getMobileWidth(context, 56),
      height: getMobileHeight(context, 270),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(getMobileFontSize(context, 50)),
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
              _showBottomSheet(context);
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

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(getMobileFontSize(context, 20))),
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
                  width: getMobileWidth(context, 60),
                  height: getMobileWidth(context, 5),
                  margin: EdgeInsets.only(
                    top: getMobileHeight(context, 8),
                    bottom: getMobileHeight(context, 10),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius:
                        BorderRadius.circular(getMobileWidth(context, 10)),
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
                    horizontal: getMobileWidth(context, 12),
                    vertical: getMobileHeight(context, 8),
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
                              borderRadius: BorderRadius.circular(
                                  getMobileFontSize(context, 20)),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: getMobileWidth(context, 16),
                              vertical: getMobileHeight(context, 10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: getMobileWidth(context, 8)),
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
