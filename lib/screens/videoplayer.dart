import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:smartschool_mobile/constants.dart';
import 'package:smartschool_mobile/models/recordingTranscript.dart';
import 'package:smartschool_mobile/services/services.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer(
      {Key? key, @required this.videoUrl, this.looping, this.recordingUrl})
      : super(key: key);
  // final VideoPlayerController? videoPlayerController;
  final String? videoUrl;
  final String? recordingUrl;
  final bool? looping;

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  ChewieController? _chewieController;
  VideoPlayerController? videoPlayerController;

  Future<List<Transcript>> getTranscript(String? id) async {
    List<Transcript> transcriptList = await Services.getRecordingTranscript(id);
    return transcriptList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('\n-------video URL---------\n');
    print(widget.videoUrl);

    videoPlayerController = VideoPlayerController.network(widget.videoUrl!);
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
        Text(
          'Transcript',
          style: kBodyText,
        ),
        Expanded(
          child: FutureBuilder(
            builder: (context, AsyncSnapshot<List<dynamic>> snapshot) =>
                snapshot.hasData
                    ? StaggeredGridView.countBuilder(
                        padding: EdgeInsets.all(15),
                        crossAxisCount: 1,
                        itemCount: snapshot.data!.length,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 15,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                            child: InkWell(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (BuildContext context) =>
                                //             VideoPage(
                                //                 id: snapshot.data!
                                //                     .recordings[index].id)));
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                height: 50,
                                decoration: BoxDecoration(
                                  // boxShadow: [
                                  //   BoxShadow(
                                  //     color: Colors.blueGrey,
                                  //     offset: const Offset(
                                  //       5.0,
                                  //       5.0,
                                  //     ),
                                  //     blurRadius: 5.0,
                                  //     spreadRadius: 1.0,
                                  //   ),
                                  // ],
                                  // color: Color(0xffF5F5DC),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      snapshot.data![index].text ?? "Hello",
                                      // "",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal),
                                      overflow: TextOverflow.clip,
                                      maxLines: 1,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    // Text(
                                    //   '${snapshot.data!.recordings[index].author.name}',
                                    //   style: TextStyle(
                                    //     color:
                                    //         Color(0xFF0D1333).withOpacity(.5),
                                    //   ),
                                    // )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
            future: getTranscript(widget.recordingUrl),
          ),
          // padding: const EdgeInsets.all(10.0),
          //     child: Text(
          //   'Transcritp here',
          //   style: TextStyle(color: Colors.white),
          // ),
        ),
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
