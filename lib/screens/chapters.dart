import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:smartschool_mobile/services/services.dart';
import 'package:smartschool_mobile/models/chapters.dart' as chapterModel;

import '../constants.dart';

class Chapters extends StatefulWidget {
  Chapters({Key? key, this.id}) : super(key: key);
  final String? id;

  @override
  _ChaptersState createState() => _ChaptersState();
}

class _ChaptersState extends State<Chapters> {
  List<chapterModel.Chapters>? chapters;

  Future<List<chapterModel.Chapters>> getChapters(String? id) async {
    chapters = await Services.getChapters(id);
    return chapters!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(),
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Hackathonbg.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Text(
                  "Chapters",
                  style: kHeadline,
                ),
                SizedBox(
                  height: 20,
                ),
                FutureBuilder(
                  initialData: [],
                  future: getChapters(widget.id),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) =>
                      snapshot.hasData
                          ? Expanded(
                              child: StaggeredGridView.countBuilder(
                                padding: EdgeInsets.all(20),
                                crossAxisCount: 1,
                                itemCount: snapshot.data!.length,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 15,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 5, 15, 5),
                                    child: InkWell(
                                      onTap: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (BuildContext context) =>
                                        //             DetailsScreen(
                                        //                 snapshot.data[index])));
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        height: 50,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.blueGrey,
                                              offset: const Offset(
                                                5.0,
                                                5.0,
                                              ),
                                              blurRadius: 5.0,
                                              spreadRadius: 1.0,
                                            ),
                                          ],
                                          color: Color(0xffF5F5DC),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        child: Center(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                snapshot.data![index].name ??
                                                    "Hello",
                                                // "",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color(0xFF0D1333),
                                                    fontWeight:
                                                        FontWeight.normal),
                                                overflow: TextOverflow.clip,
                                              ),
                                              // SizedBox(
                                              //   height: 10,
                                              // ),
                                              // Text(
                                              //   // 'Credits : ${snapshot.data[index].credits}',
                                              //   "",
                                              //   style: TextStyle(
                                              //     color: Color(0xFF0D1333)
                                              //         .withOpacity(.5),
                                              //   ),
                                              // )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                staggeredTileBuilder: (index) =>
                                    StaggeredTile.fit(1),
                              ),
                            )
                          : Center(
                              child: CircularProgressIndicator(
                              backgroundColor: Colors.green,
                            )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
