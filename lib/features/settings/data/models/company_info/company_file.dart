class CompanyFile {
  String? id;
  String? fileName;
  String? createdAt;
  String? updatedAt;
  int? v;

  CompanyFile({
    this.id,
    this.fileName,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CompanyFile.fromJson(Map<String, dynamic> json) => CompanyFile(
        id: json['_id'] as String?,
        fileName: json['fileName'] as String?,
        createdAt: json['createdAt'] as String?,
        updatedAt: json['updatedAt'] as String?,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'fileName': fileName,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v,
      };
}
