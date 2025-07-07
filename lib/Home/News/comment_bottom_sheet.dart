import 'package:flutter/material.dart';

class CommentBottomSheet extends StatefulWidget {
  const CommentBottomSheet({super.key});

  @override
  State<CommentBottomSheet> createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  final TextEditingController _commentController = TextEditingController();

  // Sample comment data
  final List<Map<String, String>> comments = List.generate(
    5,
    (index) => {
      "username": "@someone",
      "time": "2 hrs ago",
      "content":
          "Lorem ipsum dolor sit amet consectetur. Ultricies mauris blandit laoreet malesuada.",
      "likes": "400",
    },
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        children: [
          // Optional drag handle (can be removed if not needed)
          Container(
            width: 40,
            height: 5,
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          // Title
          const Text(
            "የህዝብ አስተያየት",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),

          // Comment list
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: comments.length,
              separatorBuilder: (context, index) =>
                  const Divider(color: Colors.grey, height: 20),
              itemBuilder: (context, index) {
                final comment = comments[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Username and Time
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          comment["username"]!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          comment["time"]!,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    // Comment content
                    Text(
                      comment["content"]!,
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    // Likes, Reply, Menu
                    Row(
                      children: [
                        Text(
                          comment["likes"]!,
                          style: const TextStyle(fontSize: 13),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.thumb_up_off_alt,
                          size: 16,
                          color: Colors.black54,
                        ),
                        const SizedBox(width: 16),
                        const Icon(
                          Icons.reply,
                          size: 16,
                          color: Colors.black54,
                        ),
                        const Spacer(),
                        const Icon(Icons.more_vert, size: 18),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),

          // Input field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: "Comment...",
                      hintStyle: const TextStyle(fontSize: 14),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.black54),
                  onPressed: () {
                    if (_commentController.text.isNotEmpty) {
                      setState(() {
                        comments.add({
                          "username": "@you",
                          "time": "Just now",
                          "content": _commentController.text,
                          "likes": "0",
                        });
                        _commentController.clear();
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
