// To parse this JSON data, do
//
//     final chapterDetails = chapterDetailsFromJson(jsonString);

import 'dart:convert';

ChapterDetails chapterDetailsFromJson(String str) =>
    ChapterDetails.fromJson(json.decode(str)['chapter']);

class ChapterDetails {
  ChapterDetails({
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

  List<Recording>? recordings;
  List<ResourceFile>? resourceFiles;
  String? chatBotId;
  bool? isPublished;
  String? chatbotSubKey;
  String? id;
  String? name;
  String? subject;

  List<VocabularyList>? vocabularyList;

  factory ChapterDetails.fromJson(Map<String, dynamic> json) => ChapterDetails(
        recordings: List<Recording>.from(
            json["recordings"].map((x) => Recording.fromJson(x))),
        resourceFiles: List<ResourceFile>.from(
            json["resourceFiles"].map((x) => ResourceFile.fromJson(x))),
        chatBotId: json["chatBotId"],
        isPublished: json["isPublished"],
        chatbotSubKey: json["chatbotSubKey"],
        id: json["_id"],
        name: json["name"],
        subject: json["subject"],
        vocabularyList: List<VocabularyList>.from(
            json["VocabularyList"].map((x) => VocabularyList.fromJson(x))),
      );
}

class Recording {
  Recording({
    this.id,
    this.title,
    this.author,
  });

  String? id;
  String? title;
  Author? author;

  factory Recording.fromJson(Map<String, dynamic> json) => Recording(
        id: json["_id"],
        title: json["title"],
        author: Author.fromJson(json["author"]),
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
}

class ResourceFile {
  ResourceFile({
    this.id,
    this.name,
    this.fileUrl,
    this.chapter,
    this.author,
  });

  String? id;
  String? name;
  String? fileUrl;
  String? chapter;
  Author? author;

  factory ResourceFile.fromJson(Map<String, dynamic> json) => ResourceFile(
        id: json["_id"],
        name: json["name"],
        fileUrl: json["fileUrl"],
        chapter: json["chapter"],
        author: Author.fromJson(json["author"]),
      );
}

class VocabularyList {
  VocabularyList({
    this.id,
    this.data,
  });

  String? id;
  String? data;

  factory VocabularyList.fromJson(Map<String, dynamic> json) => VocabularyList(
        id: json["_id"],
        data: json["data"],
      );
}
