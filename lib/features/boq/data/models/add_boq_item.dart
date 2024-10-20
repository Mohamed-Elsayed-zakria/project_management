class AddBoqItem {
  final String boqId;
  final String itemNumber;
  final String item;
  final int quantity;
  final double individualPrice;

  AddBoqItem({
    required this.boqId,
    required this.itemNumber,
    required this.item,
    required this.quantity,
    required this.individualPrice,
  });

  Map<String, dynamic> toJson() => {
        'itemNumber': itemNumber,
        'item': item,
        'quantity': quantity,
        'individualPrice': individualPrice,
      };
}
