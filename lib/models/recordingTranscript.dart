// To parse this JSON data, do
//
//     final transcript = transcriptFromJson(jsonString);

import 'dart:convert';

List<Transcript> transcriptFromJson(String str) => List<Transcript>.from(json
    .decode(str)['recording']['transcript']
    .map((x) => Transcript.fromJson(x)));

class Transcript {
  Transcript({
    this.from,
    this.sentiment,
    this.id,
    this.text,
    this.startTime,
    this.endTime,
    this.phrases,
    this.mId,
    this.v,
  });

  From? from;
  Sentiment? sentiment;
  String? id;
  String? text;
  int? startTime;
  int? endTime;
  List<Phrase>? phrases;
  int? mId;
  int? v;

  factory Transcript.fromJson(Map<String, dynamic> json) => Transcript(
        from: From.fromJson(json["from"]),
        sentiment: Sentiment.fromJson(json["sentiment"]),
        id: json["_id"],
        text: json["text"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        phrases:
            List<Phrase>.from(json["phrases"].map((x) => Phrase.fromJson(x))),
        mId: json["m_id"],
        v: json["__v"],
      );
}

class From {
  From({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory From.fromJson(Map<String, dynamic> json) => From(
        id: json["id"],
        name: json["name"],
      );
}

class Phrase {
  Phrase({
    this.id,
    this.type,
    this.text,
  });

  String? id;
  String? type;
  String? text;

  factory Phrase.fromJson(Map<String, dynamic> json) => Phrase(
        id: json["_id"],
        type: json["type"],
        text: json["text"],
      );
}

class Sentiment {
  Sentiment({
    this.polarity,
    this.suggested,
  });

  Polarity? polarity;
  Suggested? suggested;

  factory Sentiment.fromJson(Map<String, dynamic> json) => Sentiment(
        polarity: Polarity.fromJson(json["polarity"]),
        suggested: suggestedValues.map![json["suggested"]],
      );
}

class Polarity {
  Polarity({
    this.score,
  });

  double? score;

  factory Polarity.fromJson(Map<String, dynamic> json) => Polarity(
        score: json["score"].toDouble(),
      );
}

enum Suggested { POSITIVE, NEUTRAL, NEGATIVE }

final suggestedValues = EnumValues({
  "negative": Suggested.NEGATIVE,
  "neutral": Suggested.NEUTRAL,
  "positive": Suggested.POSITIVE
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
