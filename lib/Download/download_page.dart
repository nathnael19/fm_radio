import 'package:flutter/material.dart';
import 'package:fm_radio/bottom_navigation.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyBottomNavigation()),
            ); // or any back logic you want
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text("የወረዱ"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/girl5.png"),
                  ),
                  title: Text("የትም? (Yetim?)"),
                  subtitle: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("2025"),
                      SizedBox(width: 10),
                      Text("16+"),
                      SizedBox(width: 10),
                      Text("1hr 36 min long"),
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.more_vert),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
