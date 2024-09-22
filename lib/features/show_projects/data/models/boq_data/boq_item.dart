class BoqItem {
  String? id;
  int? itemNumber;
  String? item;
  int? quantity;
  int? individualPrice;
  String? boq;

  BoqItem({
    this.id,
    this.itemNumber,
    this.item,
    this.quantity,
    this.individualPrice,
    this.boq,
  });

  factory BoqItem.fromJson(Map<String, dynamic> json) => BoqItem(
        id: json['_id'] as String?,
        itemNumber: json['itemNumber'] as int?,
        item: json['item'] as String?,
        quantity: json['quantity'] as int?,
        individualPrice: json['individualPrice'] as int?,
        boq: json['Boq'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'itemNumber': itemNumber,
        'item': item,
        'quantity': quantity,
        'individualPrice': individualPrice,
        'Boq': boq,
      };
}
