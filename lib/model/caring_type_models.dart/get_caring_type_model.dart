class GetCaringTypeModel {
  final List<GetCaringTypeDataModel> obj;
  GetCaringTypeModel({required this.obj});

  factory GetCaringTypeModel.fromJson(Map<String, dynamic> json) {
    return GetCaringTypeModel(
      obj: List<GetCaringTypeDataModel>.from(
          json["obj"].map((x) => GetCaringTypeDataModel.fromJson(x))),
    );
  }
}

class GetCaringTypeDataModel {
  final int id;
  final String name, description;

  GetCaringTypeDataModel({
    required this.id,
    required this.name,
    required this.description,
  });

  factory GetCaringTypeDataModel.fromJson(Map<String, dynamic> json) {
    return GetCaringTypeDataModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }
}
