import '/features/timeline/presentation/manager/timeline_attachments_cubit/timeline_attachments_cubit.dart';
import '/features/timeline/presentation/manager/timeline_attachments_cubit/timeline_attachments_state.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/timeline/data/models/timeline_structure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/empty_placeholder.dart';
import '/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import '/core/utils/my_date_util.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class TimelineShowTable extends StatelessWidget {
  final ProjectDetails projectDetails;

  const TimelineShowTable({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<TimelineAttachmentsCubit>();
    return BlocBuilder<TimelineAttachmentsCubit, TimelineAttachmentsState>(
      builder: (context, state) {
        if (state is GetTimelineTableLoading) {
          return const Center(
            child: LoadingWidget(),
          );
        }
        if (state is GetTimelineTableFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        }
        return cubit.timelineTableResult.isNotEmpty
            ? SingleChildScrollView(
              child: Table(
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
                      timelineTable: cubit.timelineTableResult,
                    ),
                  ],
                ),
            )
            : const Center(
                child: EmptyPlaceholder(
                  message: "لم يتم اضافة الجدول",
                ),
              );
      },
    );
  }

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
    required List<TimelineStructure> timelineTable,
  }) {
    List<TableRow> boqItems = [];

    for (var i = 0; i < timelineTable.length; i++) {
      TimelineStructure element = timelineTable[i];
      boqItems.add(
        TableRow(
          children: [
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.middle,
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Text(
                  element.activityID ?? '--',
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
                  element.activityName ?? '--',
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
                  element.start != null
                      ? MyDateUtil.convertDateTime(
                          historyAsText: element.start!,
                        )
                      : '--',
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
                  element.finish != null
                      ? MyDateUtil.convertDateTime(
                          historyAsText: element.finish!,
                        )
                      : '--',
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
                      builder: (context) {
                        return const AlertDialog(
                          actions: [],
                        );
                      },
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
    }

    return boqItems;
  }
}
