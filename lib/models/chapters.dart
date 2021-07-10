// To parse this JSON data, do
//
//     final chapters = chaptersFromJson(jsonString);

import 'dart:convert';

List<Chapters> chaptersFromJson(String str) => List<Chapters>.from(
    json.decode(str)['chapters'].map((x) => Chapters.fromJson(x)));

class Chapters {
  Chapters({
    this.recordings,
    this.resourceFiles,
    this.chatBotId,
    this.isPublished,
    this.chatbotSubKey,
    this.id,
    this.name,
    this.subject,
    this.vocabularyList,
  });

  List<dynamic>? recordings;
  List<dynamic>? resourceFiles;
  dynamic? chatBotId;
  bool? isPublished;
  dynamic? chatbotSubKey;
  String? id;
  String? name;
  String? subject;

  List<dynamic>? vocabularyList;

  factory Chapters.fromJson(Map<String, dynamic> json) => Chapters(
        recordings: List<dynamic>.from(json["recordings"].map((x) => x)),
        resourceFiles: List<dynamic>.from(json["resourceFiles"].map((x) => x)),
        chatBotId: json["chatBotId"],
        isPublished: json["isPublished"],
        chatbotSubKey: json["chatbotSubKey"],
        id: json["_id"],
        name: json["name"],
        subject: json["subject"],
        vocabularyList:
            List<dynamic>.from(json["VocabularyList"].map((x) => x)),
      );
}
