import 'package:ethio_fm_radio/Home/News/comment_bottom_sheet.dart';
import 'package:ethio_fm_radio/Home/components/side_container_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SideContainer extends StatelessWidget {
  const SideContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      width: 56.w,
      height: 256.h,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(55.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SideContainerIcon(icon: Icons.abc, number: 400, onTap: () {}),
          SideContainerIcon(
            icon: Icons.message_outlined,
            number: 400,
            onTap: () {
              _showBottomSheet(context);
            },
          ),
          SideContainerIcon(
            icon: FontAwesomeIcons.share,
            number: 400,
            onTap: () {},
          ),
          SideContainerIcon(icon: Icons.bookmark, number: 400, onTap: () {}),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // allows full height & adjusts for keyboard
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(
                context,
              ).viewInsets.bottom, // handle keyboard
            ),
            child: Column(
              children: [
                // Drag Handle
                Container(
                  width: 60.w,
                  height: 5.h,
                  margin: EdgeInsets.only(top: 8.h, bottom: 12.h),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                // Content + Comment List
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CommentBottomSheet(onTap: () {}),
                        // Add more comments if needed
                      ],
                    ),
                  ),
                ),
                // Comment Typing Area
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
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
                              borderRadius: BorderRadius.circular(20.r),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 10.h,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      IconButton(
                        icon: Icon(Icons.send, color: Colors.blueAccent),
                        onPressed: () {
                          // TODO: Handle send action
                        },
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
