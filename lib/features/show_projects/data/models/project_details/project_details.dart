class ProjectDetails {
  final String? id;
  final String? projectName;
  final String? projectNumber;
  final String? projectPrice;
  int? projectDurationPerDay;
  final String? projectManager;
  final String? projectOwner;
  final String? projectArea;
  final String? projectCity;
  final String? projectDatePo;
  final String? projectReceiptDate;
  final String? projectFilePo;
  final int? v;

  ProjectDetails({
    this.id,
    this.projectName,
    this.projectNumber,
    this.projectPrice,
    this.projectDurationPerDay,
    this.projectManager,
    this.projectOwner,
    this.projectArea,
    this.projectCity,
    this.projectDatePo,
    this.projectReceiptDate,
    this.projectFilePo,
    this.v,
  });

  factory ProjectDetails.fromJson(Map<String, dynamic> json) {
    return ProjectDetails(
      id: json['_id'] as String?,
      projectName: json['projectName'] as String?,
      projectNumber: json['projectNumber'] as String?,
      projectPrice: json['projectPrice'] as String?,
      projectDurationPerDay: json['projectDurationPerDay'] is String
          ? int.tryParse(json['projectDurationPerDay'])
          : json['projectDurationPerDay'] as int?,
      projectManager: json['projectManager'] as String?,
      projectOwner: json['projectOwner'] as String?,
      projectArea: json['projectArea'] as String?,
      projectCity: json['projectCity'] as String?,
      projectDatePo: json['projectDatePo'] as String,
      projectReceiptDate: json['projectReceiptDate'] as String,
      projectFilePo: json['projectFilePo'] as String?,
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'projectName': projectName,
        'projectNumber': projectNumber,
        'projectPrice': projectPrice,
        'projectDurationPerDay': projectDurationPerDay,
        'projectManager': projectManager,
        'projectOwner': projectOwner,
        'projectArea': projectArea,
        'projectCity': projectCity,
        'projectDatePo': projectDatePo,
        'projectReceiptDate': projectReceiptDate,
        'projectFilePo': projectFilePo,
        '__v': v,
      };
}
