class AddPatientModel {
  final String name, roomPhoto;
  final bool isStoped;

  AddPatientModel({
    required this.name,
    required this.roomPhoto,
    required this.isStoped,
  });

  Map<String, dynamic> toJson() {
    return {"name": name, "room_Photo": roomPhoto, "isStoped": isStoped};
  }
}
