import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PodcastDetailPage extends StatefulWidget {
  const PodcastDetailPage({super.key});

  @override
  State<PodcastDetailPage> createState() => _PodcastDetailPageState();
}

class _PodcastDetailPageState extends State<PodcastDetailPage> {
  double mynum = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff80011F),
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff80011F), Color(0xFF422B2B)],
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                // color: Colors.white,
                image: DecorationImage(
                  image: AssetImage("assets/images/girl6.png"),
                ),
              ),
            ),
            Text(
              "የህይወት ታሪክ የተለየ ነው",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Column(
              children: [
                Slider(
                  min: 0,
                  max: 56,
                  value: mynum,
                  onChanged: (c) {
                    setState(() {
                      mynum = c;
                    });
                  },
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${mynum.toInt().toString()}:00",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text("56:00", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),

            playButtons(),
            likeAndCommentButtons(),

            Text("ክፍሎች"),
            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(radius: 30),
                    title: Text("dfd", style: TextStyle(color: Colors.white)),
                    subtitle: Text(
                      "jkj",
                      style: TextStyle(color: Colors.white),
                    ),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.download_for_offline_rounded,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row likeAndCommentButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("400", style: TextStyle(color: Colors.white)),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.thumb_up, color: Colors.white),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("20", style: TextStyle(color: Colors.white)),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.message, color: Colors.white),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(FontAwesomeIcons.share, color: Colors.white),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.bookmark, color: Colors.white),
        ),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text("Tip Creator", style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }

  Row playButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.skip_previous_rounded,
            size: 30,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.restore_outlined, size: 30, color: Colors.white),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.pause_circle, size: 65, color: Colors.white),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.forward_10, size: 30, color: Colors.white),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.skip_next_rounded, size: 30, color: Colors.white),
        ),
      ],
    );
  }
}
