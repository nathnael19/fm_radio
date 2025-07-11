import 'package:ethio_fm_radio/Onboarding/wellcome.dart';
import 'package:ethio_fm_radio/Profile/profile_page.dart';
import 'package:flutter/material.dart';

class MyPageView extends StatefulWidget {
  final void Function(Locale)? onLocaleChange;

  const MyPageView({super.key, this.onLocaleChange});

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    ProfilePage(onLocaleChange: widget.onLocaleChange); // ✅ inject callback
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: [
        BoardingWidget(
          pageController: _pageController,
          isLastPage: false,
          imagePath: "assets/images/home.png",
          title: "Welcome to",
          subtitle: "Ethio FM 107.8",
          description:
              "Stay informed and inspired with the latest news and trending podcasts – all in one place",
        ),
        BoardingWidget(
          pageController: _pageController,
          isLastPage: false,
          imagePath: "assets/images/news.png",
          title: "News Aggregation",
          subtitle: "All Your News in One Place",
          description:
              "From global headlines to local updates – curated just for you.",
        ),
        BoardingWidget(
          pageController: _pageController,
          isLastPage: true, //  This is the last page
          imagePath: "assets/images/podcast.png",
          title: "Discover Podcasts",
          subtitle: "Listen While You Live",
          description:
              "Explore powerful stories, interviews, and shows from your favorite creators",
        ),
      ],
    );
  }
}
