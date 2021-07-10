import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartschool_mobile/models/studentSubjects.dart';
import 'package:smartschool_mobile/services/auth.dart';
import 'package:smartschool_mobile/services/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        actions: [TextButton(onPressed: () {}, child: Text('Logout'))],
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Hackathonbg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder(
          initialData: [],
          future: getStudentSubjectsList(),
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) => snapshot
                  .hasData
              ? StaggeredGridView.countBuilder(
                  padding: EdgeInsets.all(0),
                  crossAxisCount: 2,
                  itemCount: snapshot.data!.length,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
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
                          padding: EdgeInsets.all(20),
                          height: index.isOdd ? 200 : 240,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey,
                                offset: const Offset(
                                  5.0,
                                  5.0,
                                ),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ),
                            ],
                            color: Color(0xffF5F5DC),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  // snapshot.data[index].name,
                                  "",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0xFF0D1333),
                                      fontWeight: FontWeight.normal),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Text(
                                  // 'Credits : ${snapshot.data[index].credits}',
                                  "",
                                  style: TextStyle(
                                    color: Color(0xFF0D1333).withOpacity(.5),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                )
              : Center(
                  child: CircularProgressIndicator(
                  backgroundColor: Colors.green,
                )),
        ),
      ),
    );
  }
}
