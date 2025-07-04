import 'package:flutter/material.dart';
import 'package:fm_radio/Home/Podcast/podcast_page.dart';
import 'package:fm_radio/Home/components/live_page.dart';
import 'package:fm_radio/Home/News/news_page.dart';
import 'package:fm_radio/Home/Podcast/podcast_detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double mobileWidth = MediaQuery.of(context).size.width;
    double mobileHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Expanded(
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 10),
                  color: Color(0xff80011F),
                  height: 40,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image.asset("assets/icons/logo.png"),
                      ),
                      Expanded(
                        flex: 4,
                        child: TabBar(
                          labelColor: Colors.white,
                          dividerColor: Colors.transparent,
                          unselectedLabelColor: Colors.white,
                          indicatorColor: Colors.white,
                          tabs: [
                            Container(
                              margin: EdgeInsets.only(bottom: 3),
                              child: Row(
                                children: [
                                  Icon(Icons.live_tv_rounded),
                                  SizedBox(width: 5),
                                  Text("ቀጥታ"),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 3),
                              child: Text("ዜናዎች"),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 3),
                              child: Text("ፖድካስቶች"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //////////////
                Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      LivePage(
                        mobileWidth: mobileWidth,
                        mobileHeight: mobileHeight,
                      ),
                      NewsPage(),
                      PodcastPage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
