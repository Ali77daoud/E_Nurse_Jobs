import 'dart:convert';

GetCaringDetailsModel getCaringDetailsModelFromJson(String str) =>
    GetCaringDetailsModel.fromJson(json.decode(str));

class GetCaringDetailsModel {
  Obj obj;

  GetCaringDetailsModel({
    required this.obj,
  });

  factory GetCaringDetailsModel.fromJson(Map<String, dynamic> json) =>
      GetCaringDetailsModel(
        obj: Obj.fromJson(json["obj"]),
      );
}

class Obj {
  int id;
  int nursesId;
  Nurses? nurses;
  int caringTypeId;
  CaringType? caringType;
  int patientId;
  Patient? patient;
  DateTime time;
  String description;

  Obj({
    required this.id,
    required this.nursesId,
    required this.nurses,
    required this.caringTypeId,
    this.caringType,
    required this.patientId,
    this.patient,
    required this.time,
    required this.description,
  });

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
        id: json["id"],
        nursesId: json["nurses_id"],
        nurses: json["nurses"] == null ? null : Nurses.fromJson(json["nurses"]),
        caringTypeId: json["caringType_Id"],
        caringType: json["caringType"] == null
            ? null
            : CaringType.fromJson(json["caringType"]),
        patientId: json["patient_Id"],
        patient:
            json["patient"] == null ? null : Patient.fromJson(json["patient"]),
        time: DateTime.parse(json["time"]),
        description: json["description"],
      );
}

class CaringType {
  int id;
  String name;
  String description;

  CaringType({
    required this.id,
    required this.name,
    required this.description,
  });

  factory CaringType.fromJson(Map<String, dynamic> json) => CaringType(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}

class Nurses {
  int id;
  String name;
  bool gender;
  String phone;
  bool isResigned;

  Nurses({
    required this.id,
    required this.name,
    required this.gender,
    required this.phone,
    required this.isResigned,
  });

  factory Nurses.fromJson(Map<String, dynamic> json) => Nurses(
        id: json["id"],
        name: json["name"],
        gender: json["gender"],
        phone: json["phone"],
        isResigned: json["isResigned"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "gender": gender,
        "phone": phone,
        "isResigned": isResigned,
      };
}

class Patient {
  int id;
  String name;
  String roomPhoto;
  dynamic imaga;
  bool isStoped;

  Patient({
    required this.id,
    required this.name,
    required this.roomPhoto,
    this.imaga,
    required this.isStoped,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        name: json["name"],
        roomPhoto: json["room_Photo"],
        imaga: json["imaga"],
        isStoped: json["isStoped"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "room_Photo": roomPhoto,
        "imaga": imaga,
        "isStoped": isStoped,
      };
}
