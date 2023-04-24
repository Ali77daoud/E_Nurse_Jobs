class EditCaringTypeModel {
  final int id;
  final String name, description;

  EditCaringTypeModel({
    required this.id,
    required this.name,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
    };
  }
}
