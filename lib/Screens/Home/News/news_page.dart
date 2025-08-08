import 'package:ethio_fm_radio/Screens/Home/News/components/news_page_card.dart';
import 'package:ethio_fm_radio/Screens/Home/News/components/news_page_card_small.dart';
import 'package:ethio_fm_radio/Screens/Home/News/cubit/news_cubit.dart';
import 'package:ethio_fm_radio/Screens/Home/News/model/comment_model.dart';
import 'package:ethio_fm_radio/Screens/Home/News/model/data_model.dart';
import 'package:ethio_fm_radio/Screens/Home/News/news_detail_page.dart';
import 'package:ethio_fm_radio/Screens/Saved/saved_page_news_card.dart';
import 'package:ethio_fm_radio/Screens/constants/responsive.dart';
import 'package:ethio_fm_radio/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final PageController _breakingPage = PageController();
  final PageController _sportPage = PageController();
  final PageController _foreignPage = PageController();
  final PageController _businessPage = PageController();
  final PageController _otherPage = PageController();

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

  Future<void> _refreshPage() async {
    await context.read<NewsCubit>().loadNews();
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return RefreshIndicator(
      color: Colors.white,
      edgeOffset: getMobileHeight(context, -50),
      backgroundColor: Color(0xff80011F).withAlpha(200),
      onRefresh: _refreshPage,
      child: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is NewsLoaded) {
            final breakingNews = state.category[0].data;
            final sportNews = state.category[1].data;
            final foreignNews = state.category[2].data;
            final businessNews = state.category[3].data;
            final otherNews = state.category[4].data;

            return SingleChildScrollView(
              controller: _scrollController,
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionHeader(local.breaking_news,
                      key: _topNewsKey, index: 0),
                  SizedBox(height: 16.h),
                  breakingNewsCard(context, breakingNews),
                  SizedBox(
                    height: 5.h,
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: _breakingPage,
                      count: breakingNews.length,
                      effect: ExpandingDotsEffect(
                          activeDotColor: Color(0xff80011F),
                          expansionFactor: 2,
                          dotWidth: 8.w,
                          dotHeight: 8.h),
                    ),
                  ),

                  ///Sport News
                  SizedBox(height: 24.h),
                  _buildSectionHeader(local.home_page_news_page_second_tab_bar,
                      key: _sportKey, index: 1),
                  SizedBox(height: 16.h),
                  smallCardNews(context, sportNews, _sportPage),
                  SizedBox(
                    height: 5.h,
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: _sportPage,
                      count: sportNews.length,
                      effect: ExpandingDotsEffect(
                          activeDotColor: Color(0xff80011F),
                          expansionFactor: 2,
                          dotWidth: 8.w,
                          dotHeight: 8.h),
                    ),
                  ),

                  //Foreign News
                  SizedBox(height: 24.h),
                  _buildSectionHeader(local.home_page_news_page_third_tab_bar,
                      key: _worldKey, index: 2),
                  SizedBox(height: 16.h),
                  smallCardNews(context, foreignNews, _foreignPage),
                  SizedBox(
                    height: 5.h,
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: _foreignPage,
                      count: foreignNews.length,
                      effect: ExpandingDotsEffect(
                          activeDotColor: Color(0xff80011F),
                          expansionFactor: 2,
                          dotWidth: 8.w,
                          dotHeight: 8.h),
                    ),
                  ),

                  //Business News
                  SizedBox(height: 24.h),
                  _buildSectionHeader(local.home_page_news_page_fourth_tab_bar,
                      key: _businessKey, index: 3),
                  SizedBox(height: 16.h),
                  smallCardNews(context, businessNews, _businessPage),
                  SizedBox(
                    height: 5.h,
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: _businessPage,
                      count: businessNews.length,
                      effect: ExpandingDotsEffect(
                          activeDotColor: Color(0xff80011F),
                          expansionFactor: 2,
                          dotWidth: 8.w,
                          dotHeight: 8.h),
                    ),
                  ),

                  //Other News
                  SizedBox(height: 24.h),
                  _buildSectionHeader(local.home_page_news_page_fifth_tab_bar,
                      key: _otherKey, index: 4),
                  SizedBox(height: 16.h),
                  smallCardNews(context, otherNews, _otherPage),
                  SizedBox(
                    height: 5.h,
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: _otherPage,
                      count: otherNews.length,
                      effect: ExpandingDotsEffect(
                        activeDotColor: Color(0xff80011F),
                        expansionFactor: 2,
                        dotWidth: 8.w,
                        dotHeight: 8.h,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  SizedBox smallCardNews(BuildContext context, List<DataModel> newsData,
      PageController controller) {
    return SizedBox(
      height: getMobileHeight(context, 81),
      child: PageView.builder(
        controller: controller,
        itemCount: newsData.length,
        itemBuilder: (context, index) {
          final news = newsData[index];

          final channel = news.channel;
          final title = news.title;
          final image = news.imageUrl;
          final description = news.description;
          final date = news.date;
          final comment = news.meta.comments;
          final like = news.meta.likes;
          final share = news.meta.shares;
          // final
          return NewsPageCardSmall(
            title: news.title,
            channel: news.channel,
            date: news.date,
            onTap: () => _showBottomSheet(
              context,
              channel: channel,
              comments: comment,
              comment: comment.length,
              content: description,
              date: date,
              imageUrl: image,
              like: like,
              share: share,
              title: title,
            ),
            onMore: () {},
            imageUrl: news.imageUrl,
          );
        },
      ),
    );
  }

  SizedBox breakingNewsCard(
      BuildContext context, List<DataModel> breakingNews) {
    return SizedBox(
      height: getMobileHeight(context, 245),
      child: PageView.builder(
        controller: _breakingPage,
        itemCount: breakingNews.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final news = breakingNews[index];
          final channel = news.channel;
          final title = news.title;
          final image = news.imageUrl;
          final description = news.description;
          final date = news.date;
          final comment = news.meta.comments;
          final like = news.meta.likes;
          final share = news.meta.shares;
          return NewsPageCard(
            onTap: () => _showBottomSheet(context,
                channel: channel,
                comments: comment,
                comment: comment.length,
                content: description,
                date: date,
                imageUrl: image,
                like: like,
                share: share,
                title: title),
            channel: channel,
            date: date,
            imageUrl: image,
            title: title,
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title, {Key? key, required index}) {
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
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SavedPageNewsCard(
                  index: index,
                  title: sendTitle(index),
                ),
              ),
            );
          },
          child: Text(
            AppLocalizations.of(context)!.home_page_news_page_open_all,
            style: GoogleFonts.notoSansEthiopic(
              fontSize: 12.sp,
              color: const Color(0xff1A0101),
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  String sendTitle(int index) {
    switch (index) {
      case 0:
        return AppLocalizations.of(context)!.breaking_news;
      case 1:
        return AppLocalizations.of(context)!.home_page_news_page_second_tab_bar;
      case 2:
        return AppLocalizations.of(context)!.home_page_news_page_third_tab_bar;
      case 3:
        return AppLocalizations.of(context)!.home_page_news_page_fourth_tab_bar;
      case 4:
        return AppLocalizations.of(context)!.home_page_news_page_fifth_tab_bar;
    }
    return "";
  }

  void _showBottomSheet(
    BuildContext context, {
    required String date,
    required String channel,
    required String imageUrl,
    required String title,
    required String content,
    required int like,
    required comment,
    required int share,
    required List<Comment> comments,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return NewsDetailPage(
          date: date,
          channel: channel,
          imageUrl: imageUrl,
          title: title,
          content: content,
          likeNum: like,
          commentNum: comment,
          shareNum: share,
          comments: comments,
        );
      },
    );
  }
}
