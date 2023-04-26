import 'dart:convert';
DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));
String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
    DataModel({
    required this.id,
    required this.dob,
    required this.major,
    required this.yearGroup,
    required this.residence,
    required this.bestfood,
    required this.bestmovie,
  });

  String id;
  String dob;
  String major;
  String yearGroup;
  String residence;
  String bestfood;
  String bestmovie;

  factory DataModel.fromJson(Map<String, dynamic>json) => DataModel(id: json["id"],
    dob: json["dob"],
    major: json["major"],
    yearGroup: json["yearGroup"],
    residence: json["residence"],
    bestfood: json["bestfood"],
    bestmovie: json["bestmovie"],);

  Map<String, dynamic> toJson() => {
    "id":id,
    "dob":dob,
    "major":major,
    "yearGroup":yearGroup,
    "residence":residence,
    "bestfood": bestfood,
    "bestmovie":bestmovie
  };

}