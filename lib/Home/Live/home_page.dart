import 'package:ethio_fm_radio/Home/News/news_page.dart';
import 'package:ethio_fm_radio/Home/Podcast/podcast_page.dart';
import 'package:ethio_fm_radio/Home/components/live_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10.h),
              color: const Color(0xff80011F),
              height: 60.h,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20.w),
                    child: Image.asset("assets/icons/logo.png"),
                  ),
                  SizedBox(
                    width: 307.w,
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
                children: [LivePage(), const NewsPage(), const PodcastPage()],
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
      margin: EdgeInsets.only(bottom: 3.h),
      child: Row(
        children: [
          if (isSelected) Icon(icon, size: 20.r),
          if (isSelected) SizedBox(width: 5.w),
          Text(
            title,
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
