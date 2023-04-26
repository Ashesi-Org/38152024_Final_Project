import 'dart:convert';
DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));
String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    required this.id,
    required this.name,
    required this.dob,
    required this.email,
    required this.major,
    required this.yearGroup,
    required this.residence,
    required this.bestfood,
    required this.bestmovie,
  });

  String id;
  String name;
  String dob;
  String email;
  String major;
  String yearGroup;
  String residence;
  String bestfood;
  String bestmovie;

  factory DataModel.fromJson(Map<String, dynamic>json) => DataModel(id: json["id"],
      name: json["name"],
      dob: json["dob"],
      email: json["email"],
      major: json["major"],
      yearGroup: json["yearGroup"],
      residence: json["residence"],
      bestfood: json["bestfood"],
      bestmovie: json["bestmovie"],);

  Map<String, dynamic> toJson() => {
    "id":id,
    "name":name,
    "dob":dob,
    "email":email,
    "major":major,
    "yearGroup":yearGroup,
    "residence":residence,
    "bestfood": bestfood,
    "bestmovie":bestmovie
  };

}