import 'package:flutter/cupertino.dart';

class  ServiceData{
  int id;
  String name;
  String logo;
  String createdDate;
  String updatedDate;
  String firebaseId;
  String description;
  int weight;
  bool isActive;



  ServiceData({@required this.id,@required this.name,@required this.logo,@required this.createdDate,@required this.updatedDate,
  @required this.firebaseId,@required this.description,@required this.weight,@required this.isActive});


  factory ServiceData.fromJson(Map<String, dynamic> json) {
    return ServiceData(
      id: json["id"],
      name: json["name"],
      logo: json["logo"],
      createdDate: json["createdDate"],
      updatedDate: json["updatedDate"],
      firebaseId: json["firebaseId"],
      description: json["description"],
      weight: json["weight"],
      isActive: json["isActive"],
    );
  }

}