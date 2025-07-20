import 'package:ethio_fm_radio/Databases/group_page_database.dart';
import 'package:ethio_fm_radio/Screens/Group/explore_group_chat.dart';
import 'package:ethio_fm_radio/Screens/Group/my_group_chat.dart';
import 'package:ethio_fm_radio/bottom_navigation.dart';
import 'package:ethio_fm_radio/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class GroupPage extends StatefulWidget {
  const GroupPage({super.key});

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  final groupSearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    double mobileWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(local.group_page_title),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyBottomNavigation()),
            );
          },
          icon: Icon(Icons.arrow_back_ios_new_sharp),
        ),
      ),

      ////////////////////
      body: Expanded(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 3),
                height: 35,
                child: TabBar(
                  indicator: const BoxDecoration(
                    color: Color(0xff80011F),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  labelColor: Colors.white,
                  dividerColor: Colors.transparent,
                  unselectedLabelColor: Colors.black,
                  tabs: [
                    TopBar(
                      mobileWidth: mobileWidth,
                      title: local.group_page_my_groups,
                    ),
                    TopBar(
                      mobileWidth: mobileWidth,
                      title: local.group_page_explore_groups,
                    ),
                  ],
                ),
              ),

              //////////////
              Expanded(
                child: TabBarView(
                  children: [
                    MyGroup(
                      mobileWidth: mobileWidth,
                      groupSearchController: groupSearchController,
                      myGroups: myGroups,
                    ),
                    ExploreGroups(
                      mobileWidth: mobileWidth,
                      groupSearchController: groupSearchController,
                      groupNews: groupNews,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExploreGroups extends StatelessWidget {
  const ExploreGroups({
    super.key,
    required this.mobileWidth,
    required this.groupSearchController,
    required this.groupNews,
  });

  final double mobileWidth;
  final TextEditingController groupSearchController;
  final List groupNews;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MySearchWidget(groupSearchController: groupSearchController),
        GroupNewsTopic(title: "Politics"),
        GroupNews(
          groupNews: groupNews,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ExploreGroupChat()),
            );
          },
        ),
      ],
    );
  }
}

class GroupNewsTopic extends StatelessWidget {
  final String title;
  const GroupNewsTopic({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class GroupNews extends StatelessWidget {
  final List groupNews;
  final VoidCallback onTap;
  const GroupNews({super.key, required this.groupNews, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Expanded(
      child: ListView.builder(
        itemCount: groupNews.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    onTap: onTap,
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.black,
                    ),
                    title: Text(groupNews[index][1]),
                    subtitle: Text(groupNews[index][2]),
                    trailing: Container(
                      width: 40,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0xff80011F),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            local.group_page_join_text,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 10),
                    decoration: BoxDecoration(),
                    child: Text(
                      maxLines: 2,
                      groupNews[index][3],
                      style: TextStyle(overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class MyGroup extends StatelessWidget {
  const MyGroup({
    super.key,
    required this.mobileWidth,
    required this.groupSearchController,
    required this.myGroups,
  });

  final double mobileWidth;
  final TextEditingController groupSearchController;
  final List myGroups;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MySearchWidget(groupSearchController: groupSearchController),
        GroupListView(myGroups: myGroups),
      ],
    );
  }
}

class GroupListView extends StatelessWidget {
  final List myGroups;
  const GroupListView({super.key, required this.myGroups});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: myGroups.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyGroupChat()),
                );
              },
              leading: CircleAvatar(radius: 25, backgroundColor: Colors.black),
              title: Text(myGroups[index][1]),
              subtitle: Text(myGroups[index][2]),
              trailing: CircleAvatar(
                radius: 12,
                backgroundColor: Color(0xff80011F),
                child: Center(
                  child: Text(
                    "${myGroups[index][3]}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

//
//////////////////////////////////////////////////////////////////
class MySearchWidget extends StatelessWidget {
  const MySearchWidget({super.key, required this.groupSearchController});

  final TextEditingController groupSearchController;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade50,
              ),
              child: Center(
                child: TextField(
                  controller: groupSearchController,
                  decoration: InputDecoration(
                    hintText: local.group_page_search_hint,
                    hintStyle: TextStyle(fontSize: 15),
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                local.group_page_search,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  final double mobileWidth;
  final String title;
  const TopBar({super.key, required this.mobileWidth, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      width: mobileWidth / 2 - 20,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Center(child: Text(title)),
    );
  }
}
