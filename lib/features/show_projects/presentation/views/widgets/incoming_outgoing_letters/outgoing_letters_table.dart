import '/core/widgets/show_up_animation.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class OutgoingLettersTable extends StatelessWidget {
  const OutgoingLettersTable({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowUp(
      delay: 1,
      child: Table(
        border: TableBorder.all(
          color: AppColors.kPrimaryColor,
        ),
        columnWidths: const {
          5: FixedColumnWidth(85),
          6: FixedColumnWidth(110),
        },
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
                    "النوع",
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
                    "الخطاب",
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
          buildTableOutgoingLettersNewElements(),
          buildTableOutgoingLettersNewElements(),
          buildTableOutgoingLettersNewElements(),
        ],
      ),
    );
  }

  TableRow buildTableOutgoingLettersNewElements() {
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
              "جديد",
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
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.visibility_outlined,
                color: Colors.blue,
              ),
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
