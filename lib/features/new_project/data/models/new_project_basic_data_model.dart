class NewProjectBasicDataModel {
  final String projectName;
  final String projectNumber;
  final String projectPrice;
  final String projectDurationPerDay;
  final String projectDatePo;
  final String projectFilePo;
  final String projectFilesBoq;

  NewProjectBasicDataModel({
    required this.projectName,
    required this.projectNumber,
    required this.projectPrice,
    required this.projectDurationPerDay,
    required this.projectDatePo,
    required this.projectFilePo,
    required this.projectFilesBoq,
  });

  Map<String, dynamic> toJson() {
    return {
      'projectName': projectName,
      'projectNumber': projectNumber,
      'projectPrice': projectPrice,
      'projectDurationPerDay': projectDurationPerDay,
      'projectDatePo': projectDatePo,
      'projectFilePo': projectFilePo,
      'projectFilesBoq': projectFilesBoq,
    };
  }
}
