class EditCaringModel {
  final int id, nurseId, patientId, caringTypeId;
  final String description, time;

  EditCaringModel({
    required this.id,
    required this.nurseId,
    required this.patientId,
    required this.caringTypeId,
    required this.time,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nurses_id": nurseId,
      "patient_Id": patientId,
      "caringType_Id": caringTypeId,
      "time": time,
      "description": description,
    };
  }
}
