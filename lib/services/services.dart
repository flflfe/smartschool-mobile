import 'package:flutter/cupertino.dart';
import 'package:smartschool_mobile/models/chapterDetails.dart';
import 'package:smartschool_mobile/models/chapters.dart';
import 'package:smartschool_mobile/models/studentSubjects.dart';
import 'package:smartschool_mobile/constants.dart';
import 'package:http/http.dart' as http;

class Services extends ChangeNotifier {
  static String? name;
  // static String classRoom;
  static String? token;
  static bool? isTeacher;

  static Future<List<StudentSubjects>> getStudentSubjectss() async {
    try {
      final response = await http.get(Uri.parse(subjectsUrl),
          headers: {'Authorization': 'Bearer $token'});
      print(response.body);
      if (response.statusCode == 200) {
        final List<StudentSubjects> studentSubjects =
            studentSubjectsFromJson(response.body.toString());

        return studentSubjects;
      } else {
        return List<StudentSubjects>.empty();
      }
    } catch (e) {
      return List<StudentSubjects>.empty();
    }
  }

  static Future<List<Chapters>> getChapters(String? id) async {
    try {
      final response = await http.get(Uri.parse('$subjectsUrl/$id/chapters'),
          headers: {'Authorization': 'Bearer $token'});
      print(response.body);
      if (response.statusCode == 200) {
        final List<Chapters> chapters =
            chaptersFromJson(response.body.toString());

        return chapters;
      } else {
        return List<Chapters>.empty();
      }
    } catch (e) {
      return List<Chapters>.empty();
    }
  }

  static Future<dynamic> getChapterDetails(String? id) async {
    try {
      final response = await http.get(Uri.parse('$chaptersUrl/$id'),
          headers: {'Authorization': 'Bearer $token'});
      print(response.body);
      if (response.statusCode == 200) {
        final ChapterDetails chapterDetails =
            chapterDetailsFromJson(response.body.toString());

        return chapterDetails;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
