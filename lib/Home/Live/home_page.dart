import 'package:ethio_fm_radio/Home/News/news_page.dart';
import 'package:ethio_fm_radio/Home/Podcast/podcast_page.dart';
import 'package:ethio_fm_radio/Home/components/live_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double mobileWidth = MediaQuery.of(context).size.width;
    double mobileHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10),
              color: const Color(0xff80011F),
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.asset("assets/icons/logo.png"),
                  ),
                  Expanded(
                    flex: 4,
                    child: TabBar(
                      controller: _tabController,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white70,
                      indicatorColor: Colors.white,
                      dividerColor: Colors.transparent,
                      tabs: [
                        _buildTab(0, "ቀጥታ", Icons.live_tv),
                        _buildTab(1, "ዜናዎች", Icons.article),
                        _buildTab(2, "ፖድካስቶች", Icons.podcasts),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  LivePage(
                    mobileWidth: mobileWidth,
                    mobileHeight: mobileHeight,
                  ),
                  const NewsPage(),
                  const PodcastPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(int index, String title, IconData icon) {
    bool isSelected = _tabController.index == index;
    return Container(
      margin: const EdgeInsets.only(bottom: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isSelected) Icon(icon, size: 16),
          if (isSelected) const SizedBox(width: 4),
          Text(title),
        ],
      ),
    );
  }
}
