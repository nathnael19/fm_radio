import 'package:ethio_fm_radio/Screens/Home/News/cubit/news_cubit.dart';
import 'package:ethio_fm_radio/Screens/Home/News/components/news_card.dart';
import 'package:ethio_fm_radio/Screens/Home/News/components/news_detail_card.dart';
import 'package:ethio_fm_radio/Screens/constants/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedPageNewsCard extends StatefulWidget {
  final int index;
  final String title;
  const SavedPageNewsCard(
      {super.key, required this.index, required this.title});

  @override
  State<SavedPageNewsCard> createState() => _SavedPageNewsCardState();
}

class _SavedPageNewsCardState extends State<SavedPageNewsCard> {
  bool isPlaying = false;
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is NewsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is NewsLoaded) {
            final categorySaved = state.category[widget.index].data;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: categorySaved.length,
                    itemBuilder: (context, index) {
                      final category = state.category[0].data;
                      final news = category[index];

                      final channel = news.channel;
                      final date = news.date;
                      final title = news.title;
                      final desc = news.description;
                      final like = news.meta.likes;
                      final comment = news.meta.comments.length;
                      final comments = news.meta.comments;
                      final share = news.meta.shares;
                      final image = news.imageUrl;

                      return NewsCard(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(
                                      getMobileFontSize(context, 20))),
                            ),
                            backgroundColor: Colors.white,
                            builder: (context) {
                              return FractionallySizedBox(
                                heightFactor: 0.85,
                                child: Padding(
                                  padding: EdgeInsets.all(
                                      getMobileFontSize(context, 16)),
                                  child: NewsDetailCard(
                                    commentsModel: comments,
                                    onMinimizeTapped: () {
                                      setState(() {
                                        isVisible = false;
                                      });
                                    },
                                    onCommentTapped: () {
                                      setState(() {
                                        isVisible = true;
                                      });
                                    },
                                    date: date,
                                    channel: channel,
                                    imageUrl: image,
                                    title: title,
                                    subtitle: desc,
                                    likes: like,
                                    comments: comment,
                                    shares: share,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        date: date,
                        channel: channel,
                        imageUrl: image,
                        title: title,
                        subtitle: desc,
                        likes: like,
                        comments: comment,
                        shares: share,
                      );
                    },
                  ),
                )
              ],
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
