import 'boq_item.dart';

class BoqData {
  String? id;
  String? projectId;
  String? name;
  List<BoqItem>? boqItems;

  BoqData({
    this.id,
    this.projectId,
    this.name,
    this.boqItems,
  });

  factory BoqData.fromJson(Map<String, dynamic> json) => BoqData(
        id: json['_id'] as String?,
        projectId: json['projectId'] as String?,
        name: json['name'] as String?,
        boqItems: (json['boqItems'] as List<dynamic>?)
            ?.map((e) => BoqItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'projectId': projectId,
        'name': name,
        'boqItems': boqItems?.map((e) => e.toJson()).toList(),
      };
}
