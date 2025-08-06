import 'package:ethio_fm_radio/Screens/constants/bottom_nav.dart';
import 'package:ethio_fm_radio/cubit/bottomNavbar/bottom_nav_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBottomNavigation extends StatelessWidget {
  final void Function(Locale)? onLocaleChange;

  const MyBottomNavigation({
    super.key,
    this.onLocaleChange,
  });

  @override
  Widget build(BuildContext context) {
    final bottomCubit = BlocProvider.of<BottomNavCubit>(context);
    return BlocBuilder<BottomNavCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: bottomPages[state],
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: const BoxDecoration(color: Color(0xff1A0101)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(bottomIcons.length, (index) {
                bool isSelected = state == index;
                return GestureDetector(
                  onTap: () => bottomCubit.onTap(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      bottomIcons[index],
                      color:
                          isSelected ? const Color(0xff4A0000) : Colors.white,
                      size: 28,
                    ),
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
