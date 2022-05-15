import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Video extends StatefulWidget {
  Video({Key key, this.url, this.title}) : super(key: key);
  final String title;
  final String url;

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  YoutubePlayerController controller;
  void runYoutubePlayer() {
    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.url),
        flags: YoutubePlayerFlags(
            enableCaption: false, isLive: false, autoPlay: true));
  }

  @override
  void initState() {
    runYoutubePlayer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: controller),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [player, Text("h")],
            ),
          ),
        );
      },
    );
  }
}
