// To parse this JSON data, do
//
//     final studentSubjects = studentSubjectsFromJson(jsonString);

import 'dart:convert';

List<StudentSubjects> studentSubjectsFromJson(String str) =>
    List<StudentSubjects>.from(
        json.decode(str)['subjects'].map((x) => StudentSubjects.fromJson(x)));

class StudentSubjects {
  StudentSubjects({
    this.teachers,
    this.id,
    this.name,
    this.classroom,
  });

  List<Teacher>? teachers;
  String? id;
  String? name;
  Classroom? classroom;

  factory StudentSubjects.fromJson(Map<String, dynamic> json) =>
      StudentSubjects(
        teachers: List<Teacher>.from(
            json["teachers"].map((x) => Teacher.fromJson(x))),
        id: json["_id"],
        name: json["name"],
        classroom: Classroom.fromJson(json["classroom"]),
      );
}

class Classroom {
  Classroom({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Classroom.fromJson(Map<String, dynamic> json) => Classroom(
        id: json["_id"],
        name: json["name"],
      );
}

class Teacher {
  Teacher({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        id: json["_id"],
        name: json["Name"],
      );
}
