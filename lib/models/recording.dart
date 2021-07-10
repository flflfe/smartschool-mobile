// To parse this JSON data, do
//
//     final recordingModel = recordingModelFromJson(jsonString);

import 'dart:convert';

RecordingModel recordingModelFromJson(String str) =>
    RecordingModel.fromJson(json.decode(str)['recording']);

class RecordingModel {
  RecordingModel({
    this.isRequested,
    this.isComplete,
    this.transcript,
    this.questions,
    this.followups,
    this.summary,
    this.topics,
    this.actions,
    this.id,
    this.title,
    this.recordingUrl,
    this.chapter,
    this.author,
    this.conversationId,
    this.jobId,
    this.endTime,
    this.startTime,
  });

  bool? isRequested;
  bool? isComplete;
  List<String>? transcript;
  List<String>? questions;
  List<dynamic>? followups;
  List<String>? summary;
  List<String>? topics;
  List<dynamic>? actions;
  String? id;
  String? title;
  String? recordingUrl;
  Chapter? chapter;
  Author? author;

  String? conversationId;
  String? jobId;
  DateTime? endTime;
  DateTime? startTime;

  factory RecordingModel.fromJson(Map<String, dynamic> json) => RecordingModel(
        isRequested: json["isRequested"],
        isComplete: json["isComplete"],
        transcript: List<String>.from(json["transcript"].map((x) => x)),
        questions: List<String>.from(json["questions"].map((x) => x)),
        followups: List<dynamic>.from(json["followups"].map((x) => x)),
        summary: List<String>.from(json["summary"].map((x) => x)),
        topics: List<String>.from(json["topics"].map((x) => x)),
        actions: List<dynamic>.from(json["actions"].map((x) => x)),
        id: json["_id"],
        title: json["title"],
        recordingUrl: json["recordingUrl"],
        chapter: Chapter.fromJson(json["chapter"]),
        author: Author.fromJson(json["author"]),
        conversationId: json["conversationId"],
        jobId: json["jobId"],
        endTime: DateTime.parse(json["endTime"]),
        startTime: DateTime.parse(json["startTime"]),
      );
}

class Author {
  Author({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        id: json["_id"],
        name: json["Name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "Name": name,
      };
}

class Chapter {
  Chapter({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}
