
import 'dart:convert';

List<GetCaringModel> getCaringModelFromJson(String str) => List<GetCaringModel>.from(json.decode(str).map((x) => GetCaringModel.fromJson(x)));

String getCaringModelToJson(List<GetCaringModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCaringModel {
    int id;
    int nursesId;
    Nurses nurses;
    int caringTypeId;
    CaringType? caringType;
    int patientId;
    Patient? patient;
    DateTime time;
    String description;

    GetCaringModel({
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

    factory GetCaringModel.fromJson(Map<String, dynamic> json) => GetCaringModel(
        id: json["id"],
        nursesId: json["nurses_id"],
        nurses: Nurses.fromJson(json["nurses"]),
        caringTypeId: json["caringType_Id"],
        caringType: json["caringType"] == null ? null : CaringType.fromJson(json["caringType"]),
        patientId: json["patient_Id"],
        patient: json["patient"] == null ? null : Patient.fromJson(json["patient"]),
        time: DateTime.parse(json["time"]),
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nurses_id": nursesId,
        "nurses": nurses.toJson(),
        "caringType_Id": caringTypeId,
        "caringType": caringType?.toJson(),
        "patient_Id": patientId,
        "patient": patient?.toJson(),
        "time": time.toIso8601String(),
        "description": description,
    };
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
