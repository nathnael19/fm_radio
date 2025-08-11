import 'package:flutter/material.dart';

class Check extends StatefulWidget {
  const Check({super.key});

  @override
  State<Check> createState() => _CheckState();
}

class _CheckState extends State<Check> {
  double x = 0; // horizontal alignment (-1.0 left, 0 center, 1.0 right)

  void animateContainer() {
    setState(() {
      x = 0.5; // move fully to the right
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 700),
        alignment: Alignment(x, 0), // slide horizontally
        child: GestureDetector(
          onTap: animateContainer,
          child: Container(
            width: MediaQuery.of(context).size.width - 100,
            height: 50,
            color: Colors.grey.shade800,
            child: const ListTile(
              title: Text(
                "text",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
