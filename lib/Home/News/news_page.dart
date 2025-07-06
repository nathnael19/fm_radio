import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int selectedIndex = 0;
  final _newsPageKey = GlobalKey<_NewsPageSelectorState>();

  final List<String> tabTitles = ["ሁሉንም", "ስፖርት", "የውጪ ዜና", "ቢዝነስ", "ሌሎች"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          height: 36,
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
                      horizontal: 16,
                      vertical: 6,
                    ),
                    backgroundColor: isSelected
                        ? const Color(0xff80011F)
                        : Colors.grey[200],
                    foregroundColor: isSelected ? Colors.white : Colors.black87,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    textStyle: GoogleFonts.notoSansEthiopic(fontSize: 13),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _newsPageKey.currentState?.scrollToSection(index);
                    });
                  },
                  child: Text(tabTitles[index]),
                ),
              );
            },
          ),
        ),
        Expanded(child: NewsPageSelector(key: _newsPageKey)),
      ],
    );
  }
}

class NewsPageSelector extends StatefulWidget {
  const NewsPageSelector({super.key});

  @override
  State<NewsPageSelector> createState() => _NewsPageSelectorState();
}

class _NewsPageSelectorState extends State<NewsPageSelector> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _topNewsKey = GlobalKey();
  final GlobalKey _sportKey = GlobalKey();
  final GlobalKey _worldKey = GlobalKey();
  final GlobalKey _businessKey = GlobalKey();
  final GlobalKey _otherKey = GlobalKey();

  void scrollToSection(int index) {
    final contextMap = {
      0: _topNewsKey,
      1: _sportKey,
      2: _worldKey,
      3: _businessKey,
      4: _otherKey,
    };

    final key = contextMap[index];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignment: 0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader("አርእስተ ዜና", key: _topNewsKey),
            const SizedBox(height: 10),
            _buildHorizontalCards(),

            const SizedBox(height: 16),
            _buildSectionHeader("ስፖርት", key: _sportKey),
            const SizedBox(height: 10),
            _buildSmallCards(),

            const SizedBox(height: 16),
            _buildSectionHeader("የውጪ ዜና", key: _worldKey),
            const SizedBox(height: 10),
            _buildSmallCards(),

            const SizedBox(height: 16),
            _buildSectionHeader("ቢዝነስ", key: _businessKey),
            const SizedBox(height: 10),
            _buildSmallCards(),

            const SizedBox(height: 16),
            _buildSectionHeader("ሌሎች", key: _otherKey),
            const SizedBox(height: 10),
            _buildSmallCards(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, {Key? key}) {
    return Row(
      key: key,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.notoSansEthiopic(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "ዛሬ",
          style: GoogleFonts.notoSansEthiopic(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildHorizontalCards() {
    return SizedBox(
      height: 260,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width - 60,
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[100],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  child: Image.asset(
                    "assets/images/taa.png",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 150,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "የፕርሚየር ሊግ የወሩ ምርጥ ተጨዋቾች እና ምርጥ አሰልጣኞች...",
                    style: GoogleFonts.notoSansEthiopic(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSmallCards() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width - 80,
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/images/biden.png",
                    width: 90,
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "የፕርሚየር ሊግ የወሩ ምርጥ ተጨዋቾች...",
                    style: GoogleFonts.notoSansEthiopic(fontSize: 13),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
