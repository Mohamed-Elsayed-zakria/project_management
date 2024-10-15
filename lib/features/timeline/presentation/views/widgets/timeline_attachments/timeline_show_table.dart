import '/features/timeline/presentation/manager/timeline_attachments_cubit/timeline_attachments_cubit.dart';
import '/features/timeline/presentation/manager/timeline_attachments_cubit/timeline_attachments_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class TimelineShowTable extends StatelessWidget {
  const TimelineShowTable({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimelineAttachmentsCubit, TimelineAttachmentsState>(
      builder: (context, state) {
        return Table(
          border: TableBorder.all(
            color: AppColors.kPrimaryColor,
          ),
          columnWidths: const {
            4: FixedColumnWidth(110),
          },
          children: [
            timelineTableHeader(),
            ...buildTimelineTable(
              context: context,
            ),
          ],
        );
      },
    );
  }

  // const Expanded(
  //   child: Center(
  //     child: EmptyPlaceholder(message: "لم يتم اضافة الجدول"),
  //   ),
  // ),

  TableRow timelineTableHeader() {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Text(
              "معرف النشاط",
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
              "اسم النشاط",
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
              "البداية",
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
              "النهاية",
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
              "تعديل",
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

  List<TableRow> buildTimelineTable({
    required BuildContext context,
  }) {
    List<TableRow> boqItems = [];
    for (var i = 0; i < 5; i++) {
      boqItems.add(
        TableRow(
          children: [
            const TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Text(
                  '--',
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
                  '--',
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
                  '--',
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
                  '--',
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
                    Icons.edit_outlined,
                    color: AppColors.kPrimaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return boqItems;
  }
}
