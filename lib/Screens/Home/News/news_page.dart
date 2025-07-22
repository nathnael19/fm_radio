import 'package:ethio_fm_radio/Screens/Home/News/news_detail_page.dart';
import 'package:ethio_fm_radio/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  int selectedIndex = 0;
  final _newsPageKey = GlobalKey<_NewsPageSelectorState>();

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final List<String> tabTitles = [
      local.home_page_news_page_first_tab_bar,
      local.home_page_news_page_second_tab_bar,
      local.home_page_news_page_third_tab_bar,
      local.home_page_news_page_fourth_tab_bar,
      local.home_page_news_page_fifth_tab_bar,
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 15,
            decoration: BoxDecoration(
              color: const Color(0xff80011F),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 3),
            height: 30.h,
            color: Colors.white,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tabTitles.length,
              itemBuilder: (context, index) {
                bool isSelected = selectedIndex == index;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 2.h,
                      ),
                      backgroundColor: isSelected
                          ? const Color(0xff80011F)
                          : Colors.grey[200],
                      foregroundColor:
                          isSelected ? Colors.white : Colors.black87,
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
      ),
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
  final PageController _horizontalPage = PageController();

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
    final local = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      controller: _scrollController,
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(local.breaking_news, key: _topNewsKey),
          SizedBox(height: 16.h),
          _buildHorizontalCards(),
          SizedBox(
            height: 5.h,
          ),
          Center(
            child: SmoothPageIndicator(
              controller: _horizontalPage,
              count: 2,
              effect: ExpandingDotsEffect(
                  activeDotColor: Color(0xff80011F),
                  expansionFactor: 2,
                  dotWidth: 8.w,
                  dotHeight: 8.h),
            ),
          ),
          SizedBox(height: 24.h),
          _buildSectionHeader(
            local.home_page_news_page_second_tab_bar,
            key: _sportKey,
          ),
          SizedBox(height: 16.h),
          Column(children: [_buildSmallCards(), _buildSmallCards()]),
          SizedBox(height: 24.h),
          _buildSectionHeader(
            local.home_page_news_page_third_tab_bar,
            key: _worldKey,
          ),
          SizedBox(height: 16.h),
          Column(children: [_buildSmallCards(), _buildSmallCards()]),
          SizedBox(height: 24.h),
          _buildSectionHeader(
            local.home_page_news_page_fourth_tab_bar,
            key: _businessKey,
          ),
          SizedBox(height: 16.h),
          Column(children: [_buildSmallCards(), _buildSmallCards()]),
          SizedBox(height: 24.h),
          _buildSectionHeader(
            local.home_page_news_page_fifth_tab_bar,
            key: _otherKey,
          ),
          SizedBox(height: 16.h),
          Column(children: [_buildSmallCards(), _buildSmallCards()]),
        ],
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
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          AppLocalizations.of(context)!.home_page_news_page_open_all,
          style: GoogleFonts.notoSansEthiopic(
            fontSize: 12.sp,
            color: const Color(0xff1A0101),
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return NewsDetailPage();
      },
    );
  }

  Widget _buildHorizontalCards() {
    return Column(
      children: [
        SizedBox(
          height: 242.h,
          child: PageView.builder(
            controller: _horizontalPage,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: 2,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => _showBottomSheet(context),
                child: Container(
                  width: 1.sw,
                  height: 242.h,
                  margin: EdgeInsets.only(right: 2.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    border:
                        Border.all(color: const Color(0xffEDE4E6), width: 1),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/gambela.png",
                        fit: BoxFit.fitWidth,
                        height: 150.h,
                        width: 350.w,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 5.h,
                        ),
                        child: Text(
                          "የፕርሚየር ሊግ የወሩ ምርጥ ተጨዋቾች እና ምርጥ አሰልጣኞች እጩዎች ይፋ ሆኑ!",
                          style: GoogleFonts.notoSansEthiopic(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8.w),
                        child: Row(
                          children: [
                            const Text("2 hr ago"),
                            SizedBox(width: 10.w),
                            Icon(Icons.rectangle,
                                size: 10.r, color: Colors.grey),
                            SizedBox(width: 5.w),
                            const Text("Ethio FM"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSmallCards() {
    return SizedBox(
      height: 82.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true, // 🟢 Fix: Allows rendering inside Column
        physics: const ClampingScrollPhysics(), // 🟢 Fix scroll physics
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            width: 350.w,
            margin: EdgeInsets.only(right: 20.w),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: const Color(0xffEDE4E6), width: 1),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.r),
                  child: Image.asset(
                    "assets/images/biden.png",
                    width: 60.w,
                    height: 60.w,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "የፕርሚየር ሊግ የወሩ ምርጥ ተጨዋቾች እና ምርጥ አሰልጣኞች እጩዎች ይፋ ሆኑ!",
                        maxLines: 2,
                        style: GoogleFonts.notoSansEthiopic(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.g_mobiledata, size: 18.r),
                              Text(
                                "Source",
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(width: 20.w),
                              Text(
                                "2h ago",
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Icon(Icons.more_vert, size: 20.r),
                          ),
                        ],
                      ),
                    ],
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
