import 'package:ethio_fm_radio/Screens/Onboarding/wellcome.dart';
import 'package:flutter/material.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: [
        BoardingWidget(
          angle: -0.35,
          pageController: _pageController,
          circleBack: "assets/icons/backcircle.svg",
          isLastPage: false,
          imagePath: "assets/images/home.png",
          title: "Welcome to",
          subtitle: "Ethio FM 107.8",
          description:
              "Stay informed and inspired with the latest news and trending podcasts – all in one place",
        ),
        BoardingWidget(
          angle: 0.2,
          pageController: _pageController,
          circleBack: "assets/icons/backcircle.svg",
          isLastPage: false,
          imagePath: "assets/images/news.png",
          title: "News Aggregation",
          subtitle: "All Your News in One Place",
          description:
              "From global headlines to local updates – curated just for you.",
        ),
        BoardingWidget(
          angle: 1.2,
          pageController: _pageController,
          circleBack: "assets/icons/backcircle.svg",
          isLastPage: true,
          imagePath: "assets/images/podcast.png",
          title: "Discover Podcasts",
          subtitle: "All Your News in One Place",
          description:
              "Explore powerful stories, interviews, and shows from your favorite creators",
        ),
      ],
    );
  }
}
