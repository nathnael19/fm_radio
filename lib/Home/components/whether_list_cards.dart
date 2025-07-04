import 'package:flutter/material.dart';

class WhetherListCards extends StatelessWidget {
  final List wheather;
  const WhetherListCards({super.key, required this.wheather});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: wheather.length,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.white,
            title: Text(
              wheather[index][0],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(wheather[index][1], color: wheather[index][3]),
                Text(
                  " ${wheather[index][2]}°",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
