import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({Key? key, @required this.videoUrl, this.looping})
      : super(key: key);
  // final VideoPlayerController? videoPlayerController;
  final String? videoUrl;
  final bool? looping;

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  ChewieController? _chewieController;
  VideoPlayerController? videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController = VideoPlayerController.network(
        'https://codekavya.blob.core.windows.net/videos/004023959359810814-Food%20-%20Talking%20about%20Food%20-%20Beginner%20English%20-%20A%20Conversation%20about%20Food.mp4');

    _chewieController = ChewieController(
        videoPlayerController: videoPlayerController!,
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
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          // padding: const EdgeInsets.all(10.0),
          child: Chewie(
            controller: _chewieController!,
          ),
        ),
        Expanded(
            // padding: const EdgeInsets.all(10.0),
            child: Text(
          'Transcritp here',
          style: TextStyle(color: Colors.white),
        )),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    // TODO: implement dispose

    videoPlayerController?.dispose();
    _chewieController?.dispose();
  }
}
