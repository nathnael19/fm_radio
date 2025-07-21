import 'package:audioplayers/audioplayers.dart';
import 'package:ethio_fm_radio/Screens/Download/components/list_of_downloads.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PodcastDetailPage extends StatefulWidget {
  final String path;
  final AudioPlayer audioPlayer;
  const PodcastDetailPage({
    super.key,
    required this.audioPlayer,
    required this.path,
  });

  @override
  State<PodcastDetailPage> createState() => _PodcastDetailPageState();
}

class _PodcastDetailPageState extends State<PodcastDetailPage> {
  Duration _duration = Duration();
  Duration _position = Duration();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    setupAudio();
  }

  Future<void> setupAudio() async {
    widget.audioPlayer.onDurationChanged.listen((d) {
      if (mounted) {
        setState(() {
          _duration = d;
        });
      }
    });

    widget.audioPlayer.onPositionChanged.listen((p) {
      if (mounted) {
        setState(() {
          _position = p;
        });
      }
    });

    await widget.audioPlayer.setSourceUrl(widget.path);
    await widget.audioPlayer.resume(); // 🔥 START PLAYING to get duration
    setState(() {
      isPlaying = true;
    });
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return duration.inHours > 0
        ? "$hours:$minutes:$seconds"
        : "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffAA2424),
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
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
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/girl6.png"),
                ),
              ),
            ),
            const Text(
              "የህይወት ታሪክ የተለየ ነው",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _duration.inSeconds > 0
                    ? SizedBox(
                        width: 350.w,
                        child: Slider(
                          min: 0.0,
                          max: _duration.inSeconds.toDouble(),
                          value: _position.inSeconds.toDouble().clamp(
                                0.0,
                                _duration.inSeconds.toDouble(),
                              ),
                          onChanged: (double value) {
                            widget.audioPlayer.seek(
                              Duration(seconds: value.toInt()),
                            );
                          },
                        ),
                      )
                    : const Padding(
                        padding: EdgeInsets.all(12),
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                SizedBox(
                  width: 325.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formatTime(_position),
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        formatTime(_duration),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            playButtons(),
            likeAndCommentButtons(),
            const Text("ክፍሎች", style: TextStyle(color: Colors.white)),
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
            children: [
              const Text("400", style: TextStyle(color: Colors.white)),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.thumb_up, color: Colors.white),
              ),
            ],
          ),
          Row(
            children: [
              const Text("20", style: TextStyle(color: Colors.white)),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.message, color: Colors.white),
              ),
            ],
          ),
          Row(
            children: [
              const Text("4", style: TextStyle(color: Colors.white)),
              IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.share, color: Colors.white),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.bookmark, color: Colors.white),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xffEDE4E6),
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
            onPressed: () async {
              await widget.audioPlayer.seek(
                _position - const Duration(seconds: 10),
              );
            },
            icon: Icon(Icons.replay_10, size: 30.r, color: Colors.white),
          ),
          IconButton(
            onPressed: () async {
              if (isPlaying) {
                await widget.audioPlayer.pause();
              } else {
                await widget.audioPlayer.resume();
              }
              setState(() {
                isPlaying = !isPlaying;
              });
            },
            icon: Icon(
              isPlaying ? Icons.pause_circle : Icons.play_circle,
              size: 78.r,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () async {
              await widget.audioPlayer.seek(
                _position + const Duration(seconds: 10),
              );
            },
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
