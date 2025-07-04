import 'package:flutter/material.dart';

class ExploreGroupChat extends StatelessWidget {
  const ExploreGroupChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(200),
      appBar: AppBar(
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Group 1", style: TextStyle(fontSize: 17)),
            Text("1.2k Members", style: TextStyle(fontSize: 13)),
          ],
        ),
        actions: [
          Container(
            width: 40,
            height: 30,
            decoration: BoxDecoration(
              color: Color(0xff80011F),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: GestureDetector(
                onTap: () {},
                child: Text("Join", style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Start writing",
            suffix: IconButton(onPressed: () {}, icon: Icon(Icons.send)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GroupChatContainer(
              isSender: true,
              noDislike: 20,
              noLike: 105,
              time: 2,
              content:
                  "Lorem ipsum dolor sit amet consectetur. Sit suspendisse sit lacinia tellus in posuere purus rhoncus aenean. Cum pharetra donec leo tristique tellus pharetra pellentesque duis. Interdum cursus lectus elit ipsum laoreet habitant fermentum. Felis amet aliquet justo egestas. Lobortis quis ut sit consequat amet.",
            ),
            GroupChatContainer(
              isSender: false,
              noDislike: 20,
              noLike: 105,
              time: 2,
              username: "@username",
              content:
                  "Lorem ipsum dolor sit amet consectetur. Sit suspendisse sit lacinia tellus in posuere purus rhoncus aenean. Cum pharetra donec leo tristique tellus pharetra pellentesque duis. Interdum cursus lectus elit ipsum laoreet habitant fermentum. Felis amet aliquet justo egestas. Lobortis quis ut sit consequat amet.",
            ),
            GroupChatContainer(
              isSender: true,
              noDislike: 20,
              noLike: 105,
              time: 2,
              content:
                  "Lorem ipsum dolor sit amet consectetur. Sit suspendisse sit lacinia tellus in posuere purus rhoncus aenean. Cum pharetra donec leo tristique tellus pharetra pellentesque duis. Interdum cursus lectus elit ipsum laoreet habitant fermentum. Felis amet aliquet justo egestas. Lobortis quis ut sit consequat amet.",
            ),
          ],
        ),
      ),
    );
  }
}

class GroupChatContainer extends StatelessWidget {
  final int time;
  final String content;
  final int noLike;
  final int noDislike;
  final bool isSender;
  final String username;

  const GroupChatContainer({
    super.key,
    required this.time,
    required this.content,
    required this.noLike,
    required this.noDislike,
    required this.isSender,
    this.username = "me",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isSender ? Colors.grey.shade300 : Colors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(radius: 15),
                  SizedBox(width: 10),
                  Text(username),
                ],
              ),
              Text("${time.toString()} hr ago"),
            ],
          ),
          SizedBox(height: 10),
          Text(content),
          Row(
            children: [
              Text(noLike.toString()),
              IconButton(onPressed: () {}, icon: Icon(Icons.thumb_up)),
              SizedBox(width: 20),
              Text(noDislike.toString()),
              IconButton(onPressed: () {}, icon: Icon(Icons.thumb_down)),
            ],
          ),
        ],
      ),
    );
  }
}
