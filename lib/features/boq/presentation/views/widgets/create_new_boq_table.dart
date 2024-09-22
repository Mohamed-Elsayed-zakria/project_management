import '/features/show_projects/presentation/views/widgets/project_details_add_ons_letters.dart';
import '/features/boq/presentation/manager/add_boq_item_cubit/add_boq_item_cubit.dart';
import '/features/boq/presentation/manager/add_boq_item_cubit/add_boq_item_state.dart';
import '/features/boq/data/models/boq_data/boq_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'edite_quantity_boq_dialog.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import 'add_new_boq_item_button.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class CreateNewBoqTable extends StatelessWidget {
  final BoqData boqData;
  final int index;
  const CreateNewBoqTable({
    super.key,
    required this.boqData,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AddNewBoqItemButton(boqData: boqData),
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
            boqData.name ?? '--',
            textAlign: TextAlign.center,
            style: AppStyle.tabTextStyle.copyWith(
              color: AppColors.kPrimaryColor,
            ),
          ),
        ),
        BlocConsumer<AddBoqItemCubit, AddBoqItemState>(
          listener: (context, state) {
            if (state is AddBoqItemSuccess) {
              AppPages.back(context);
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                Table(
                  border: TableBorder.all(
                    color: AppColors.kPrimaryColor,
                  ),
                  children: index == 0
                      ? [
                          boqPrimaryTableHeader(),
                          ...buildTableRowPrimaryBoqNewElements(),
                        ]
                      : [
                          createBoqModifiedTableHeader(),
                          ...buildTableRowBoqModifiedNewElements(
                              context: context),
                        ],
                ),
                Table(
                  border: TableBorder.all(
                    color: AppColors.kPrimaryColor,
                  ),
                  children: [
                    boqTableFooter(),
                    const TableRow(
                      children: [
                        TableCell(
                          verticalAlignment: TableCellVerticalAlignment.middle,
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: Text(
                              '0.0',
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
          },
        ),
      ],
    );
  }

  TableRow boqPrimaryTableHeader() {
    return TableRow(
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
    );
  }

  TableRow createBoqModifiedTableHeader() {
    return TableRow(
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
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Text(
              "النسبة للكمية",
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
              "تعديل الكمية",
              textAlign: TextAlign.center,
              style: AppStyle.tabTextStyle.copyWith(
                color: AppColors.kPrimaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<TableRow> buildTableRowPrimaryBoqNewElements() {
    List<TableRow> boqItems = [];
    boqData.boqItems?.forEach(
      (element) {
        boqItems.add(
          TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    element.itemNumber?.toString() ?? '--',
                    textAlign: TextAlign.center,
                    style: AppStyle.tabTextStyle,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    element.item ?? '--',
                    textAlign: TextAlign.center,
                    style: AppStyle.tabTextStyle,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    element.quantity?.toString() ?? '--',
                    textAlign: TextAlign.center,
                    style: AppStyle.tabTextStyle,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    element.individualPrice?.toString() ?? '--',
                    textAlign: TextAlign.center,
                    style: AppStyle.tabTextStyle,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    element.totalPrice?.toString() ?? '--',
                    textAlign: TextAlign.center,
                    style: AppStyle.tabTextStyle,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    return boqItems;
  }

  List<TableRow> buildTableRowBoqModifiedNewElements({
    required BuildContext context,
  }) {
    List<TableRow> boqItems = [];
    boqData.boqItems?.forEach(
      (element) {
        boqItems.add(
          TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    element.itemNumber?.toString() ?? '--',
                    textAlign: TextAlign.center,
                    style: AppStyle.tabTextStyle,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    element.item ?? '--',
                    textAlign: TextAlign.center,
                    style: AppStyle.tabTextStyle,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    element.quantity?.toString() ?? '--',
                    textAlign: TextAlign.center,
                    style: AppStyle.tabTextStyle,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    element.individualPrice?.toString() ?? '--',
                    textAlign: TextAlign.center,
                    style: AppStyle.tabTextStyle,
                  ),
                ),
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    element.totalPrice?.toString() ?? '--',
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
                    "1 %",
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
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => const EditeQuantityBoqDialog(),
                      );
                    },
                    child: const Icon(
                      Icons.edit_outlined,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
    return boqItems;
  }

  TableRow boqTableFooter() {
    return TableRow(
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
    );
  }
}
