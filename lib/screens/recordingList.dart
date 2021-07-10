import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:smartschool_mobile/services/services.dart';

import '../constants.dart';

class RecordingsPage extends StatefulWidget {
  const RecordingsPage({Key? key, this.id}) : super(key: key);
  final String? id;

  @override
  _RecordingsPageState createState() => _RecordingsPageState();
}

class _RecordingsPageState extends State<RecordingsPage>
    with SingleTickerProviderStateMixin {
  Future<dynamic> getChapterDetails(String? id) async {
    final chapterDetails = await Services.getChapterDetails(id);
    return chapterDetails!;
  }

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Recordings'),
    Tab(
      text: 'Resources',
    ),
  ];
  TabController? _tabController;

  int _initialIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        vsync: this, length: myTabs.length, initialIndex: _initialIndex);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
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
        Column(
          children: [
            Container(
              decoration: new BoxDecoration(color: Colors.black),
              child: new TabBar(
                indicatorPadding: EdgeInsets.all(5),
                indicatorWeight: 3.0,
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                controller: _tabController,
                tabs: myTabs,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              // height: 10,
            ),
            // Text(
            //   "Recordings",
            //   style: kHeadline,
            // ),
            // SizedBox(
            //   height: 20,
            // ),

            Expanded(
              child: FutureBuilder(
                future: getChapterDetails(widget.id),
                builder: (context, AsyncSnapshot<dynamic> snapshot) => snapshot
                        .hasData
                    ? TabBarView(controller: _tabController, children: [
                        StaggeredGridView.countBuilder(
                          padding: EdgeInsets.all(15),
                          crossAxisCount: 1,
                          itemCount: snapshot.data!.recordings.length,
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
                                  //             DetailsScreen(
                                  //                 snapshot.data[index])));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  height: 80,
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
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        snapshot.data!.recordings[index]
                                                .title ??
                                            "Hello",
                                        // "",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xFF0D1333),
                                            fontWeight: FontWeight.normal),
                                        overflow: TextOverflow.clip,
                                        maxLines: 1,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${snapshot.data!.recordings[index].author.name}',
                                        style: TextStyle(
                                          color:
                                              Color(0xFF0D1333).withOpacity(.5),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                        ),
                        StaggeredGridView.countBuilder(
                          padding: EdgeInsets.all(15),
                          crossAxisCount: 1,
                          itemCount: snapshot.data!.resourceFiles.length,
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
                                  //             DetailsScreen(
                                  //                 snapshot.data[index])));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  height: 80,
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
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        snapshot.data!.resourceFiles[index]
                                                .name ??
                                            "Hello",
                                        // "",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Color(0xFF0D1333),
                                            fontWeight: FontWeight.normal),
                                        overflow: TextOverflow.clip,
                                        maxLines: 1,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${snapshot.data!.resourceFiles[index].author.name}',
                                        style: TextStyle(
                                          color:
                                              Color(0xFF0D1333).withOpacity(.5),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                        ),
                      ])
                    : Center(
                        child: CircularProgressIndicator(
                        backgroundColor: Colors.green,
                      )),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
