class FormData {
  String? id;
  String? projectId;
  String? formNumber;
  String? formDescription;
  String? createdAt;
  String? updatedAt;
  String? formFile;

  FormData({
    this.id,
    this.projectId,
    this.formNumber,
    this.formDescription,
    this.createdAt,
    this.updatedAt,
    this.formFile,
  });

  factory FormData.fromJson(Map<String, dynamic> json) => FormData(
        id: json['_id'] as String?,
        projectId: json['projectId'] as String?,
        formNumber: json['formNumber'] as String?,
        formDescription: json['formDescription'] as String?,
        formFile: json['formFile'] as String?,
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'projectId': projectId,
        'formNumber': formNumber,
        'formDescription': formDescription,
        'formFile': formFile,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}
