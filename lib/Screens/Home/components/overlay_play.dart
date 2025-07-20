import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OverlayPlay extends StatefulWidget {
  final String imageUrl;
  final String title;
  const OverlayPlay({super.key, required this.imageUrl, required this.title});

  @override
  State<OverlayPlay> createState() => _OverlayPlayState();
}

class _OverlayPlayState extends State<OverlayPlay> {
  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Color(0xff1A0101),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(widget.imageUrl),
              ),
              SizedBox(width: 10),
              Text(widget.title, style: TextStyle(color: Colors.white)),
            ],
          ),
          Row(
            children: [
              Image.asset("assets/images/soundwave.png", width: 100),
              IconButton(
                onPressed: () {},
                icon: isPlaying
                    ? Text("")
                    : Icon(Icons.clear, color: Colors.white),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isPlaying = !isPlaying;
                  });
                },
                icon: Icon(
                  isPlaying ? FontAwesomeIcons.pause : FontAwesomeIcons.play,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
