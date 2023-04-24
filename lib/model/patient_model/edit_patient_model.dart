class EditPatientModel {
  final int id;
  final String name, roomPhoto;
  final bool isStoped;

  EditPatientModel({
    required this.id,
    required this.name,
    required this.roomPhoto,
    required this.isStoped,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "room_Photo": roomPhoto,
      "isStoped": isStoped
    };
  }
}
