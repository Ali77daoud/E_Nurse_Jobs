class AddCaringTypeModel {
  final String name, description;

  AddCaringTypeModel({
    required this.name,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
    };
  }
}
