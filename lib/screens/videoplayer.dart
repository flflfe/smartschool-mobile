import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer(
      {Key? key, @required this.videoPlayerController, this.looping})
      : super(key: key);
  final VideoPlayerController? videoPlayerController;
  final bool? looping;

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  ChewieController? _chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chewieController = ChewieController(
        videoPlayerController: widget.videoPlayerController!,
        aspectRatio: 16 / 9,
        autoInitialize: true,
        looping: widget.looping!,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(
              errorMessage,
              style: TextStyle(color: Colors.white),
            ),
          );
        });
  }

  @override
  void dispose() {
    super.dispose();
    // TODO: implement dispose

    widget.videoPlayerController!.dispose();
    _chewieController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Chewie(
        controller: _chewieController!,
      ),
    );
  }
}
