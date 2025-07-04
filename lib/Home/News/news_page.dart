import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int selectedIndex = 0;

  final List<String> tabTitles = ["ሁሉንም", "ስፖርት", "የውጪ ዜና", "ቢዝነስ", "ሌሎች"];

  final List<Widget> tabContents = [
    Center(child: Text("1")),
    Center(child: Text("2")),
    Center(child: Text("3")),
    Center(child: Text("4")),
    Center(child: Text("5")),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Custom Button TabBar
        Container(
          margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          height: 30,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: tabTitles.length,
            itemBuilder: (context, index) {
              bool isSelected = selectedIndex == index;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 4,
                    ),
                    backgroundColor: isSelected
                        ? const Color(0xff80011F)
                        : Colors.grey[300],
                    foregroundColor: isSelected ? Colors.white : Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Text(
                    tabTitles[index],
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              );
            },
          ),
        ),

        // Tab content
        Expanded(child: tabContents[selectedIndex]),
      ],
    );
  }
}
