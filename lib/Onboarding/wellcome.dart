import 'package:ethio_fm_radio/Auth/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingWidget extends StatefulWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String description;
  final PageController pageController;
  final bool isLastPage;

  const BoardingWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.pageController,
    required this.isLastPage,
  });

  @override
  State<BoardingWidget> createState() => _BoardingWidgetState();
}

class _BoardingWidgetState extends State<BoardingWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              width: 43,
              height: 32,
              margin: const EdgeInsets.only(top: 28, left: 325),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SigninPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Color(0xff1A0101), fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              widget.imagePath,
              width: 390,
              height: 350,
              fit: BoxFit.contain,
            ),
            Container(
              width: 344,
              height: 216,
              margin: const EdgeInsets.only(top: 44),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: Color(0xff1A0101),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.subtitle,
                    style: const TextStyle(
                      color: Color(0xff80011F),
                      fontSize: 32,
                    ),
                  ),
                  const SizedBox(height: 23),
                  Text(
                    widget.description,
                    style: const TextStyle(
                      color: Color(0xff1A0101),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 45, left: 40),
              width: 440,
              height: 76,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: widget.pageController,
                    count: 3,
                    effect: const WormEffect(
                      activeDotColor: Color(0xff80011F),
                      dotHeight: 14,
                      dotWidth: 14,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (widget.isLastPage) {
                        // Go to SignupPage
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SigninPage(),
                          ),
                        );
                      } else {
                        // Go to next onboarding page
                        widget.pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Container(
                      width: 200,
                      height: 76,
                      decoration: const BoxDecoration(
                        color: Color(0xff80011F),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(54),
                          bottomLeft: Radius.circular(54),
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
