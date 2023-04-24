class GetPatientModel {
  final List<GetPatienDataModel> obj;
  GetPatientModel({required this.obj});

  factory GetPatientModel.fromJson(Map<String, dynamic> json) {
    return GetPatientModel(
      obj: List<GetPatienDataModel>.from(
          json["obj"].map((x) => GetPatienDataModel.fromJson(x))),
    );
  }
}

class GetPatienDataModel {
  final int id;
  final String name, roomPhoto;
  final bool isStoped;

  GetPatienDataModel({
    required this.id,
    required this.name,
    required this.roomPhoto,
    required this.isStoped,
  });

  factory GetPatienDataModel.fromJson(Map<String, dynamic> json) {
    return GetPatienDataModel(
      id: json['id'],
      name: json['name'],
      roomPhoto: json['room_Photo'],
      isStoped: json['isStoped'],
    );
  }
}
