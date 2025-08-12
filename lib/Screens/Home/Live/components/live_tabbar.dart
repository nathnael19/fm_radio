import 'package:ethio_fm_radio/Screens/Home/Live/screens/currency/screen/currency_list_cards.dart';
import 'package:ethio_fm_radio/Screens/Home/Live/screens/recent/recent_list_cards.dart';
import 'package:ethio_fm_radio/Screens/Home/Live/screens/today/todays_list_cards.dart';
import 'package:ethio_fm_radio/Screens/Home/Live/screens/weather/screen/whether_list_cards.dart';
import 'package:ethio_fm_radio/Screens/constants/responsive.dart';
import 'package:ethio_fm_radio/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    List<String> tabTitles = [
      local.home_page_live_page_bottom_tabbar_one,
      local.home_page_live_page_bottom_tabbar_two,
      local.home_page_live_page_bottom_tabbar_three,
      local.home_page_live_page_bottom_tabbar_four,
    ];
    return SizedBox(
      child: Column(
        children: [
          // Button TabBar
          Container(
            margin:
                EdgeInsets.symmetric(vertical: getMobileHeight(context, 14)),
            height: getMobileHeight(context, 27),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tabTitles.length,
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;
                return Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: getMobileWidth(context, 6)),
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
                      foregroundColor:
                          isSelected ? Colors.white : Color(0xff1A0101),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            getMobileFontSize(context, 8)),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: getMobileWidth(context, 10),
                        vertical: getMobileHeight(context, 4),
                      ),
                    ),
                    child: Text(
                      tabTitles[index],
                      style: TextStyle(
                        fontSize: getMobileFontSize(context, 14),
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
                    return WhetherListCards();
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
