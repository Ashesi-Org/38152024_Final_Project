import 'dart:convert';
DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));
String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  DataModel({
    required this.email,
    required this.message,
  });

  String email;
  String message;

  factory DataModel.fromJson(Map<String, dynamic>json) => DataModel(email: json["email"],
    message:json["message"],);

  Map<String, dynamic> toJson() => {
    "email":email,
    "message":message,
  };

}