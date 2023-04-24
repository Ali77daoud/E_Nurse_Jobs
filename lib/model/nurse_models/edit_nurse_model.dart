class EditNurseModel {
  final int id;
  final String name, phone;
  final bool gender, isResigned;

  EditNurseModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.gender,
    required this.isResigned,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "gender": gender,
      "phone": phone,
      "isResigned": isResigned
    };
  }
}
