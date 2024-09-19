import '/features/show_projects/presentation/views/widgets/project_details_add_ons_letters.dart';
import 'project_details_add_boq_data_dialog.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class ProjectDetailsPrimaryTableBoq extends StatelessWidget {
  const ProjectDetailsPrimaryTableBoq({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => ProjectDetailsAddBoqDataDialog(
                    onPressed: () {
                      AppPages.back(context);
                    },
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  "اضافة",
                  style: AppStyle.tabTextStyle.copyWith(
                    color: AppColors.kPrimaryColor,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            ProjectDetailsAddOnsLetters(
              otherAdditionsOnTap: () => AppPages.to(
                path: AppRoutes.otherAdditions,
                context: context,
              ),
              formsOnTap: () => AppPages.to(
                path: AppRoutes.forms,
                context: context,
              ),
              lettersOnTap: () => AppPages.to(
                path: AppRoutes.incomingOutgoingLetters,
                context: context,
              ),
            ),
          ],
        ),
        const Divider(),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.kPrimaryColor,
            ),
          ),
          padding: const EdgeInsets.all(8),
          child: Text(
            "الجدول الأساسي",
            textAlign: TextAlign.center,
            style: AppStyle.tabTextStyle.copyWith(
              color: AppColors.kPrimaryColor,
            ),
          ),
        ),
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
                      'البند',
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
                      'الكمية',
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
                      'السعر الافرادي',
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
                      'السعر الاجمالي',
                      textAlign: TextAlign.center,
                      style: AppStyle.tabTextStyle.copyWith(
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            buildTableRowBoqNewElements(),
            buildTableRowBoqNewElements(),
            buildTableRowBoqNewElements(),
          ],
        ),
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
                      'المجموع الكلي',
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
                      'المجموع الكلي شامل الضريبة',
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
                      'النسبة المئوية',
                      textAlign: TextAlign.center,
                      style: AppStyle.tabTextStyle.copyWith(
                        color: AppColors.kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const TableRow(
              children: [
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Text(
                      "150",
                      textAlign: TextAlign.center,
                      style: AppStyle.tabTextStyle,
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Text(
                      "172.5",
                      textAlign: TextAlign.center,
                      style: AppStyle.tabTextStyle,
                    ),
                  ),
                ),
                TableCell(
                  verticalAlignment: TableCellVerticalAlignment.middle,
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Text(
                      "1 %",
                      textAlign: TextAlign.center,
                      style: AppStyle.tabTextStyle,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  TableRow buildTableRowBoqNewElements() {
    return const TableRow(
      children: [
        TableCell(
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
        TableCell(
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
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: Text(
              "10",
              textAlign: TextAlign.center,
              style: AppStyle.tabTextStyle,
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: Text(
              "5",
              textAlign: TextAlign.center,
              style: AppStyle.tabTextStyle,
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: Text(
              "50",
              textAlign: TextAlign.center,
              style: AppStyle.tabTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
