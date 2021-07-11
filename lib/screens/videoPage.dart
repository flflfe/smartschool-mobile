import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:smartschool_mobile/services/services.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'screen.dart' as screens;

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key, this.id}) : super(key: key);
  final String? id;

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  Future<dynamic> getRecordingDetails(String? id) async {
    final recordingDetails = await Services.getRecordingDetails(id);
    return recordingDetails!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: FutureBuilder(
            future: getRecordingDetails(widget.id),
            builder: (context, AsyncSnapshot<dynamic> snapshot) =>
                snapshot.hasData
                    ? screens.VideoPlayer(
                        videoUrl: '${snapshot.data.recordingUrl}',
                        looping: false,
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      )),
      ),
    );
  }
}
