abstract class ParseArabicNumber {
  static double? parseArabicNumber(String input) {
    if (input.isEmpty) return null;
    final englishNumber =
        input.replaceAllMapped(RegExp(r'[٠١٢٣٤٥٦٧٨٩]'), (match) {
      const arabicToEnglishMap = {
        '٠': '0',
        '١': '1',
        '٢': '2',
        '٣': '3',
        '٤': '4',
        '٥': '5',
        '٦': '6',
        '٧': '7',
        '٨': '8',
        '٩': '9',
      };
      return arabicToEnglishMap[match.group(0)]!;
    });

    return double.tryParse(englishNumber);
  }
}
