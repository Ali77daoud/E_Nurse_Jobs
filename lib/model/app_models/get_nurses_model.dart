class GetNursesModel {
  final List<GetNursesDataModel> obj;
  GetNursesModel({required this.obj});

  factory GetNursesModel.fromJson(Map<String, dynamic> json) {
    return GetNursesModel(
      obj: List<GetNursesDataModel>.from(
          json["obj"].map((x) => GetNursesDataModel.fromJson(x))),
    );
  }
}

class GetNursesDataModel {
  final int id;
  final String name, phone;
  final bool gender, isResigned;

  GetNursesDataModel(
      {required this.id,
      required this.name,
      required this.phone,
      required this.gender,
      required this.isResigned});

  factory GetNursesDataModel.fromJson(Map<String, dynamic> json) {
    return GetNursesDataModel(
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
        gender: json['gender'],
        isResigned: json['isResigned']);
  }
}
