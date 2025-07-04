import 'package:flutter/material.dart';
import 'package:fm_radio/Home/components/currency_list_cards.dart';
import 'package:fm_radio/Home/components/recent_list_cards.dart';
import 'package:fm_radio/Home/components/todays_list_cards.dart';
import 'package:fm_radio/Home/components/whether_list_cards.dart';

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
            margin: const EdgeInsets.symmetric(vertical: 3),
            height: 45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tabTitles.length,
              itemBuilder: (context, index) {
                final isSelected = selectedIndex == index;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSelected
                          ? const Color(0xff4A0000)
                          : Colors.grey[300],
                      foregroundColor: isSelected ? Colors.white : Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                    child: Text(tabTitles[index]),
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
                    return CurrencyListCards(currency: widget.currency);
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
