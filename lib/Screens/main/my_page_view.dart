import 'package:ethio_fm_radio/Screens/Onboarding/wellcome.dart';
import 'package:flutter/material.dart';

class MyPageView extends StatelessWidget {
  const MyPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
    return PageView(
      controller: pageController,
      children: [
        BoardingWidget(
          angle: -0.35,
          pageController: pageController,
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
          pageController: pageController,
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
          pageController: pageController,
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
