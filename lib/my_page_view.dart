import 'package:ethio_fm_radio/Auth/signin_page.dart';
import 'package:ethio_fm_radio/Onboarding/wellcome.dart';
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
        // ✅ LAST PAGE with button to go to LoginPage
        Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/podcast.png", height: 300),
              const SizedBox(height: 20),
              const Text(
                "Discover Podcasts",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Listen While You Live",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Explore powerful stories, interviews, and shows from your favorite creators",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[700],
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SigninPage(), // ✅ Go to LoginPage
                    ),
                  );
                },
                child: const Text(
                  "Get Started",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
