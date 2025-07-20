import 'package:ethio_fm_radio/Screens/Auth/signin_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:svg_flutter/svg.dart';

class BoardingWidget extends StatefulWidget {
  final String imagePath;
  final String circleBack; // Your circular background image path
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
            // Skip Button
            Container(
              margin: EdgeInsets.only(top: 10.h, right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
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
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        color: Color(0xff1A0101),
                        fontSize: 20.sp,
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
                  angle: widget
                      .angle, // Rotation angle in radians (e.g., 0.5 = ~28 degrees)
                  child: SvgPicture.asset(
                    widget.circleBack, // circular shape image
                    width: 300.w,
                    height: 220.h,
                    fit: BoxFit.contain,
                  ),
                ),

                // Main Illustration
                Image.asset(
                  widget.imagePath,
                  width: 390,
                  height: 350.h,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            // Title, Subtitle, and Description
            Container(
              width: 344,
              margin: EdgeInsets.only(top: 44.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: Color(0xff1A0101),
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    widget.subtitle,
                    style: TextStyle(
                      color: Color(0xff80011F),
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Text(
                    widget.description,
                    style: TextStyle(
                      color: Color(0xff1A0101),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            // Bottom Section: Indicator and Next Button
            Container(
              margin: EdgeInsets.only(top: 45.h, left: 20.w),
              width: 440,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmoothPageIndicator(
                    controller: widget.pageController,
                    count: 3,
                    effect: WormEffect(
                      activeDotColor: Color(0xff80011F),
                      dotHeight: 14.h,
                      dotWidth: 14.w,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (widget.isLastPage) {
                        // Go to SigninPage
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
                      width: 170.w,
                      height: 76.h,
                      decoration: BoxDecoration(
                        color: Color(0xff80011F),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(54.r),
                          bottomLeft: Radius.circular(54.r),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 24.r,
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
