class OtherAdditionsData {
  String? id;
  String? projectId;
  String? number;
  String? description;
  String? formFile;
  String? createdAt;
  String? updatedAt;

  OtherAdditionsData({
    this.id,
    this.projectId,
    this.number,
    this.description,
    this.formFile,
    this.createdAt,
    this.updatedAt,
  });

  factory OtherAdditionsData.fromJson(Map<String, dynamic> json) {
    return OtherAdditionsData(
      id: json['_id'] as String?,
      projectId: json['projectId'] as String?,
      number: json['number'] as String?,
      description: json['description'] as String?,
      formFile: json['formFile'] as String?,
      createdAt: json['createdAt']  as String?,
      updatedAt: json['updatedAt']  as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'projectId': projectId,
        'number': number,
        'description': description,
        'formFile': formFile,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
      };
}
