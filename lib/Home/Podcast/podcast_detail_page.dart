import 'package:ethio_fm_radio/Download/components/list_of_downloads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        backgroundColor: Color(0xffAA2424),
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xffAA2424), Color(0xFF000000)],
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 266.w,
              height: 266.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                // color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/girl6.png"),
                ),
              ),
            ),
            Text(
              "የህይወት ታሪክ የተለየ ነው",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 350.w,
                  child: Slider(
                    min: 0,
                    max: 56,
                    value: mynum,
                    onChanged: (c) {
                      setState(() {
                        mynum = c;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 325.w,
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
                  return ListOfDownloads(
                    onTap: () {},
                    icon: Icons.download_for_offline_outlined,
                    title: "የትም? (Yetim?)",
                    imageUrl: "assets/images/girl3.png",
                    length: "1hr 30 min",
                    other: "16+",
                    year: "2025",
                    color: Colors.white,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox likeAndCommentButtons() {
    return SizedBox(
      width: 360.w,
      child: Row(
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("4", style: TextStyle(color: Colors.white)),
              IconButton(
                onPressed: () {},
                icon: Icon(FontAwesomeIcons.share, color: Colors.white),
              ),
            ],
          ),

          IconButton(
            onPressed: () {},
            icon: Icon(Icons.bookmark, color: Colors.white),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xffEDE4E6),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                child: Text(
                  "Tip Creator",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox playButtons() {
    return SizedBox(
      width: 300.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.skip_previous_rounded,
              size: 30.r,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.restore_outlined, size: 30.r, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.pause_circle, size: 78.r, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.forward_10, size: 30.r, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.skip_next_rounded,
              size: 30.r,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
