import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class IncomingLettersContent extends StatelessWidget {
  const IncomingLettersContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Table(
          border: TableBorder.all(
            color: AppColors.kPrimaryColor,
          ),
          children: [
            TableRow(
              children: [
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Text(
                      'الرقم',
                      textAlign: TextAlign.center,
                      style: AppStyle.tabTextStyle.copyWith(
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Text(
                      'التاريخ',
                      textAlign: TextAlign.center,
                      style: AppStyle.tabTextStyle.copyWith(
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Text(
                      'الموضوع',
                      textAlign: TextAlign.center,
                      style: AppStyle.tabTextStyle.copyWith(
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Text(
                      'حالة الرد',
                      textAlign: TextAlign.center,
                      style: AppStyle.tabTextStyle.copyWith(
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Text(
                      'فعل',
                      textAlign: TextAlign.center,
                      style: AppStyle.tabTextStyle.copyWith(
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            buildTableIncomingLettersNewElements(),
            buildTableIncomingLettersNewElements(),
          ],
        )
      ],
    );
  }

  TableRow buildTableIncomingLettersNewElements() {
    return TableRow(
      children: [
        const TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: Text(
              "1",
              textAlign: TextAlign.center,
              style: AppStyle.tabTextStyle,
            ),
          ),
        ),
        const TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: Text(
              "2024/10/20",
              textAlign: TextAlign.center,
              style: AppStyle.tabTextStyle,
            ),
          ),
        ),
        const TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: Text(
              "تحت الانشاء",
              textAlign: TextAlign.center,
              style: AppStyle.tabTextStyle,
            ),
          ),
        ),
        const TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: Text(
              "لم يتم الرد",
              textAlign: TextAlign.center,
              style: AppStyle.tabTextStyle,
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.edit_outlined,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.delete_outlined,
                    color: Colors.red,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
