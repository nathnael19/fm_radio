import 'package:ethio_fm_radio/Onboarding/wellcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: DicoverPodcast(),
      home: PageView(
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
      ),
    );
  }
}
