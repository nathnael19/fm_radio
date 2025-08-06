import 'package:ethio_fm_radio/Screens/Auth/signin_page.dart';
import 'package:ethio_fm_radio/Screens/constants/app_color.dart';
import 'package:ethio_fm_radio/Screens/constants/responsive.dart';
import 'package:ethio_fm_radio/cubit/first_time/first_time_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingWidget extends StatelessWidget {
  final String imagePath;
  final String circleBack;
  final String title;
  final String subtitle;
  final String description;
  final PageController pageController;
  final bool isLastPage;
  final double angle;

  const BoardingWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.pageController,
    required this.angle,
    required this.isLastPage,
    required this.circleBack,
  });

  @override
  Widget build(BuildContext context) {
    final firstTimeCubit = BlocProvider.of<FirstTimeCubit>(context);
    final appColor = AppColor();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            // Skip Button
            Container(
              margin: EdgeInsets.only(
                  top: getMobileHeight(context, 10),
                  right: getMobileWidth(context, 20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      firstTimeCubit.completeOnBoarding();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SigninPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: appColor.titleTextColor,
                        fontSize: getMobileFontSize(context, 20),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Stack with Circular Background and Main Image
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                // Circle Background
                Transform.rotate(
                  angle:
                      angle, // Rotation angle in radians (e.g., 0.5 = ~28 degrees)
                  child: SvgPicture.asset(
                    circleBack, // circular shape image
                    width: getMobileWidth(context, 300),
                    height: getMobileHeight(context, 220),
                    fit: BoxFit.contain,
                  ),
                ),

                // Main Illustration
                Image.asset(
                  imagePath,
                  width: getMobileWidth(context, 390),
                  height: getMobileHeight(context, 350),
                  fit: BoxFit.contain,
                ),
              ],
            ),
            // Title, Subtitle, and Description
            Container(
              width: getMobileWidth(context, 344),
              margin: EdgeInsets.only(top: getMobileHeight(context, 44)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: appColor.titleTextColor,
                      fontSize: getMobileFontSize(context, 36),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Color(0xff80011F),
                      fontSize: getMobileFontSize(context, 32),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: getMobileHeight(context, 32)),
                  Text(
                    description,
                    style: TextStyle(
                      color: appColor.titleTextColor,
                      fontSize: getMobileFontSize(context, 20),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            // Bottom Section: Indicator and Next Button
            Container(
              margin: EdgeInsets.only(
                  top: getMobileHeight(context, 45),
                  left: getMobileWidth(context, 20)),
              width: getMobileWidth(context, 440),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: WormEffect(
                      activeDotColor: Color(0xff80011F),
                      dotHeight: getMobileHeight(context, 14),
                      dotWidth: getMobileWidth(context, 14),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (isLastPage) {
                        // Go to SigninPage
                        firstTimeCubit.completeOnBoarding();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SigninPage(),
                          ),
                        );
                      } else {
                        // Go to next onboarding page
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Container(
                      width: getMobileWidth(context, 170),
                      height: getMobileHeight(context, 76),
                      decoration: BoxDecoration(
                        color: Color(0xff80011F),
                        borderRadius: BorderRadius.only(
                          topLeft:
                              Radius.circular(getMobileFontSize(context, 50)),
                          bottomLeft:
                              Radius.circular(getMobileFontSize(context, 50)),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: getMobileFontSize(context, 24),
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

void saveChanges() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool("firstTime", true);
}
