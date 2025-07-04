import 'package:flutter/material.dart';
import 'package:fm_radio/bottom_navigation.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyBottomNavigation()),
            );
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text("ስብስቦች"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: 2,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 70,
                          height: 70,
                          child: Image.asset(
                            "assets/images/girl.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 70,
                          height: 70,
                          child: Image.asset(
                            "assets/images/girl2.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 70,
                          height: 70,
                          child: Image.asset(
                            "assets/images/man.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 70,
                          height: 70,
                          child: Image.asset(
                            "assets/images/man2.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
