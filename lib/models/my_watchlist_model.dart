// To parse this JSON data, do
//
//     final myWatchList = myWatchListFromJson(jsonString);

import 'dart:convert';

List<MyWatchListModel> myWatchListFromJson(String str) =>
    List<MyWatchListModel>.from(
        json.decode(str).map((x) => MyWatchListModel.fromJson(x)));

String myWatchListToJson(List<MyWatchListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyWatchListModel {
  MyWatchListModel({
    required this.model,
    required this.pk,
    required this.fields,
  });

  Model? model;
  int pk;
  Fields fields;

  factory MyWatchListModel.fromJson(Map<String, dynamic> json) =>
      MyWatchListModel(
        model: modelValues.map[json["model"]],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": modelValues.reverse[model],
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.watched,
    required this.title,
    required this.rating,
    required this.releaseDate,
    required this.review,
  });

  bool watched;
  String title;
  int rating;
  DateTime releaseDate;
  String review;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        watched: json["watched"],
        title: json["title"],
        rating: json["rating"],
        releaseDate: DateTime.parse(json["release_date"]),
        review: json["review"],
      );

  Map<String, dynamic> toJson() => {
        "watched": watched,
        "title": title,
        "rating": rating,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "review": review,
      };
}

enum Model { MYWATCHLISTMODEL_MYWATCHLISTMODEL }

final modelValues = EnumValues(
    {"mywatchlist.mywatchlist": Model.MYWATCHLISTMODEL_MYWATCHLISTMODEL});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
