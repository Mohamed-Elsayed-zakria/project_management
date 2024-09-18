class NewProjectModel {
  final String projectName;
  final String projectNumber;
  final String projectPrice;
  final String projectDurationPerDay;
  final String projectManager;
  final String projectOwner;
  final String projectArea;
  final String projectCity;
  final String projectDatePo;
  final String projectReceiptDate;
  final String projectFilePo;
  final String projectFilesBoq;

  NewProjectModel({
    required this.projectName,
    required this.projectNumber,
    required this.projectPrice,
    required this.projectDurationPerDay,
    required this.projectManager,
    required this.projectOwner,
    required this.projectArea,
    required this.projectCity,
    required this.projectDatePo,
    required this.projectReceiptDate,
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
      'projectReceiptDate': projectReceiptDate,
      'projectFilePo': projectFilePo,
      'projectFilesBoq': projectFilesBoq,
      'projectManager': projectManager,
      'projectOwner': projectOwner,
      'projectArea': projectArea,
      'projectCity': projectCity,
    };
  }
}
