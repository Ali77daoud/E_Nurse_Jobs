class AddCaringModel {
  final int nurseId, patientId, caringTypeId;
  final String description, time;
  AddCaringModel({
    required this.nurseId,
    required this.patientId,
    required this.caringTypeId,
    required this.time,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      "nurses_id": nurseId,
      "patient_Id": patientId,
      "caringType_Id": caringTypeId,
      "time": time,
      "description": description,
    };
  }
}
