class AddNurseModel {
  final String name, phone;
  final bool gender, isResigned;

  AddNurseModel({
    required this.name,
    required this.phone,
    required this.gender,
    required this.isResigned,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "gender": gender,
      "phone": phone,
      "isResigned": isResigned
    };
  }
}
