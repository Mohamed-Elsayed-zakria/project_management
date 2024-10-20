class BoqItem {
  String? id;
  String? itemNumber;
  String? item;
  int? quantity;
  int? individualPrice;
  num? totalPrice;
  String? boq;

  BoqItem({
    this.id,
    this.itemNumber,
    this.item,
    this.quantity,
    this.individualPrice,
    this.totalPrice,
    this.boq,
  });

  factory BoqItem.fromJson(Map<String, dynamic> json) => BoqItem(
        id: json['_id'] as String?,
        itemNumber: json['itemNumber'] as String?,
        item: json['item'] as String?,
        quantity: json['quantity'] as int?,
        individualPrice: json['individualPrice'] as int?,
        totalPrice: json['totalPrice'] as num?,
        boq: json['Boq'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'itemNumber': itemNumber,
        'item': item,
        'quantity': quantity,
        'individualPrice': individualPrice,
        'totalPrice': totalPrice,
        'Boq': boq,
      };
}
