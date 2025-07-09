import 'package:ethio_fm_radio/Home/components/currency_list_cards.dart';
import 'package:ethio_fm_radio/Home/components/recent_list_cards.dart';
import 'package:ethio_fm_radio/Home/components/todays_list_cards.dart';
import 'package:ethio_fm_radio/Home/components/whether_list_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LiveTabBars extends StatefulWidget {
  const LiveTabBars({
    super.key,
    required this.recentPrograms,
    required this.currency,
    required this.wheathers,
    required this.todaysProgram,
  });

  final List recentPrograms;
  final List currency;
  final List wheathers;
  final List todaysProgram;

  @override
  State<LiveTabBars> createState() => _MytTabBarState();
}

class _MytTabBarState extends State<LiveTabBars> {
  int selectedIndex = 0;

  final List<String> tabTitles = [
    "በቅርቡ የተላለፉ",
    "ምንዛሬ",
    "የአየር ሁኔታ",
    "የዛሬ ፕሮግራሞች",
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          // Button TabBar
          Container(
            margin: EdgeInsets.symmetric(vertical: 14.h),
            height: 27.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tabTitles.length,
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 6.w),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSelected
                          ? const Color(0xff80011F)
                          : Colors.grey[300],
                      foregroundColor: isSelected
                          ? Colors.white
                          : Color(0xff1A0101),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                    ),
                    child: Text(
                      tabTitles[index],
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Tab content area
          Expanded(
            child: Builder(
              builder: (context) {
                switch (selectedIndex) {
                  case 0:
                    return RecentListCards(
                      recentPrograms: widget.recentPrograms,
                    );
                  case 1:
                    return CurrencyListCards();
                  case 2:
                    return WhetherListCards(wheather: widget.wheathers);
                  case 3:
                    return TodaysListCards(todaysProgram: widget.todaysProgram);
                  default:
                    return const Center(child: Text("Invalid tab"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
