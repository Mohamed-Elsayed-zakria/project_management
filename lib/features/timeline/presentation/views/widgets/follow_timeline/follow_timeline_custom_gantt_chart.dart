import '/features/timeline/presentation/manager/follow_timeline_cubit/follow_timeline_state.dart';
import '/features/timeline/presentation/manager/follow_timeline_cubit/follow_timeline_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import '/core/widgets/gantt_chart-master/gantt_default_sticky_area_cell.dart';
import '/core/widgets/gantt_chart-master/gantt_default_week_header.dart';
import '/core/widgets/gantt_chart-master/gantt_default_day_header.dart';
import '/features/timeline/data/models/timeline_structure.dart';
import '/core/widgets/gantt_chart-master/gantt_view.dart';
import '/core/widgets/gantt_chart-master/week_day.dart';
import '/core/widgets/gantt_chart-master/event.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_sticky_area_week_builder.dart';
import '/core/widgets/empty_placeholder.dart';
import 'custom_sticky_area_day_builder.dart';
import '/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import '/core/constant/style.dart';

class FollowTimelineCustomGanttChart extends StatelessWidget {
  final ProjectDetails projectDetails;

  const FollowTimelineCustomGanttChart({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<FollowTimelineCubit>();
    return BlocBuilder<FollowTimelineCubit, FollowTimelineState>(
      builder: (context, state) {
        if (state is GetTimelineTableLoading) {
          return const Center(
            child: LoadingWidget(),
          );
        }
        if (state is GetTimelineTableFailure) {
          if (state.errMessage == "No data available") {
            return const Center(
              child: EmptyPlaceholder(
                message: "لم يتم اضافة الجدول",
              ),
            );
          }
          return Center(
            child: Text(
              state.errMessage,
              style: AppStyle.tabTextStyle,
            ),
          );
        }
        if (cubit.timelineTableResult.isEmpty) {
          return const Center(
            child: EmptyPlaceholder(
              message: "لم يتم اضافة الجدول",
            ),
          );
        }
        return GanttChartView(
          stickyAreaWeekBuilder: (context) {
            return CustomStickyAreaWeekBuilder(
              visible: !cubit.showDaysRow,
            );
          },
          stickyAreaDayBuilder: (context) {
            return const CustomStickyAreaDayBuilder();
          },
          startDate: cubit.startDate(
            timelineData: cubit.timelineTableResult,
          )!,
          maxDuration: cubit.maxDuration(
            timelineData: cubit.timelineTableResult,
          ),
          dayWidth: cubit.dayWidth,
          eventHeight: 65,
          stickyAreaWidth: 200,
          showStickyArea: cubit.showStickyArea,
          stickyAreaEventBuilder: (context, eventIndex, event, eventColor) {
            return GanttChartDefaultStickyAreaCell(
              event: event,
              eventIndex: eventIndex,
              eventColor: eventColor,
              widgetBuilder: (context) => AutoSizeText(
                "${event.displayName}",
                textAlign: TextAlign.center,
              ),
            );
          },
          weekHeaderBuilder: cubit.customWeekHeader
              ? (context, weekDate) => GanttChartDefaultWeekHeader(
                    weekDate: weekDate,
                    color: Colors.black,
                    backgroundColor: Colors.yellow,
                    border: const BorderDirectional(
                      end: BorderSide(color: Colors.green),
                    ),
                  )
              : null,
          dayHeaderBuilder: cubit.customDayHeader
              ? (context, date, bool isHoliday) => GanttChartDefaultDayHeader(
                    date: date,
                    isHoliday: isHoliday,
                    color: isHoliday ? Colors.yellow : Colors.black,
                    backgroundColor: isHoliday ? Colors.grey : Colors.yellow,
                  )
              : null,
          showDays: cubit.showDaysRow,
          weekEnds: const {WeekDay.friday, WeekDay.saturday},
          // isExtraHoliday: (context, day) {
          //   //define custom holiday logic for each day
          //   return DateUtils.isSameDay(DateTime(2022, 7, 1), day);
          // },
          startOfTheWeek: WeekDay.sunday,
          events: buildEvents(
            timelineData: cubit.timelineTableResult,
          ),
        );
      },
    );
  }

  List<GanttEventBase> buildEvents({
    required List<TimelineStructure> timelineData,
  }) {
    List<GanttEventBase> items = [];
    for (int i = 0; i < 50; i++) {
      var element = timelineData[i];
      if (element.activityName != null) {
        if (element.start != null && element.finish != null) {
          DateTime startDate = DateTime.parse(element.start!);
          DateTime finishDate = DateTime.parse(element.finish!);

          items.add(
            GanttAbsoluteEvent(
              startDate: startDate,
              endDate: finishDate,
              displayName: element.activityName,
            ),
          );
        } else {
          items.add(
            GanttRelativeEvent(
              relativeToStart: const Duration(days: 0),
              duration: const Duration(days: 0),
              displayName: element.activityName,
            ),
          );
        }
      }
    }
    return items;
  }
}
