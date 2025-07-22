import 'package:ethio_fm_radio/Screens/Home/News/news_page.dart';
import 'package:ethio_fm_radio/Screens/Home/Podcast/podcast_page.dart';
import 'package:ethio_fm_radio/Screens/Home/components/live_page.dart';
import 'package:ethio_fm_radio/Screens/Home/components/overlay_play.dart';
import 'package:ethio_fm_radio/l10n/app_localizations.dart';
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
    final local = AppLocalizations.of(context)!;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10.h),
                  color: const Color(0xff80011F),
                  height: 60.h,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20.w),
                        child: Image.asset(
                          "assets/icons/logo.png",
                          width: 35,
                        ),
                      ),
                      Expanded(
                        child: TabBar(
                          controller: _tabController,
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.white70,
                          indicatorColor: Colors.white,
                          dividerColor: Colors.transparent,
                          isScrollable:
                              false, // 🟢 FIX: tabs fit evenly in width
                          tabs: [
                            _buildTab(
                              0,
                              local.home_page_live_page_first_tab_bar,
                              Icons.live_tv,
                            ),
                            _buildTab(
                              1,
                              local.home_page_live_page_second_tab_bar,
                              Icons.article,
                            ),
                            _buildTab(
                              2,
                              local.home_page_live_page_third_tab_bar,
                              Icons.podcasts,
                            ),
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
                      LivePage(),
                      const NewsPage(),
                      const PodcastPage()
                    ],
                  ),
                ),
              ],
            ),
            OverlayPlay(
              imageUrl: "",
              title: "",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(int index, String title, IconData icon) {
    bool isSelected = _tabController.index == index;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // 🟢 Center icon+text
      children: [
        Icon(
          icon,
          size: 16.r,
          color: isSelected ? Colors.white : Colors.white70,
        ),
        SizedBox(width: 4.w),
        Text(
          title,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : Colors.white70,
          ),
        ),
      ],
    );
  }
}
