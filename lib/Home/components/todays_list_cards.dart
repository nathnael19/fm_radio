import 'package:flutter/material.dart';

class TodaysListCards extends StatelessWidget {
  final List todaysProgram;
  const TodaysListCards({super.key, required this.todaysProgram});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: todaysProgram.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(7),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade600,
                  offset: Offset(0, 1),
                  blurRadius: 1.5,
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  todaysProgram[index][0],
                  width: 170,
                  height: 100,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(todaysProgram[index][1]),
                    Text(todaysProgram[index][2]),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.notifications),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
