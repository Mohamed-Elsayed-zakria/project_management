class ProjectSettings {
  String? id;
  num? valueAddedTax;
  List<dynamic>? holidays;
  String? createdAt;
  String? updatedAt;
  int? v;

  ProjectSettings({
    this.id,
    this.valueAddedTax,
    this.holidays,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ProjectSettings.fromJson(Map<String, dynamic> json) {
    return ProjectSettings(
      id: json['_id'] as String?,
      valueAddedTax: json['valueAddedTax'] as num?,
      holidays: json['holidays'] as List<dynamic>?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      v: json['__v'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'valueAddedTax': valueAddedTax,
        'holidays': holidays,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        '__v': v,
      };
}
