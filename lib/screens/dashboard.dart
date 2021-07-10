import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartschool_mobile/models/studentSubjects.dart';
import 'package:smartschool_mobile/screens/screen.dart';
import 'package:smartschool_mobile/services/auth.dart';
import 'package:smartschool_mobile/services/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:smartschool_mobile/constants.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<StudentSubjects>? studentSubjects;

  Future<List<StudentSubjects>> getStudentSubjectsList() async {
    studentSubjects = await Services.getStudentSubjectss();
    return studentSubjects!;
  }

  @override
  Widget build(BuildContext context) {
    Auth _auth = Provider.of<Auth>(context, listen: false);
    // _auth.isTeacher == true ? _isTeacher = true : _isTeacher = false;

    // Services.classRoom = _auth.getClassRoom;
    Services.token = _auth.getToken;
    Services.name = _auth.getName;
    // Services.isTeacher = _auth.isTeacher;
    return Scaffold(
      // drawer: Drawer(),
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        // centerTitle: true,
        title: Text(
          _auth.getName ?? "",
          style: kBodyText,
        ),
        actions: [
          TextButton(
              onPressed: () async {
                String _returnString = await _auth.signOut();
                print(_returnString);
                if (_returnString == "success") {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Root()),
                      (route) => false);
                }
              },
              child: Text('Logout'))
        ],
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
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage("assets/images/Hackathonbg.png"),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Text(
                  "Subjects",
                  style: kHeadline,
                ),
                SizedBox(
                  height: 20,
                ),
                FutureBuilder(
                  initialData: [],
                  future: getStudentSubjectsList(),
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
