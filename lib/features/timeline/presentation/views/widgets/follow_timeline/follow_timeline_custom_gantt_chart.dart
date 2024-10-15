import '/features/timeline/presentation/manager/follow_timeline_cubit/follow_timeline_state.dart';
import '/features/timeline/presentation/manager/follow_timeline_cubit/follow_timeline_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gantt_chart/gantt_chart.dart';
import 'package:flutter/material.dart';

class FollowTimelineCustomGanttChart extends StatelessWidget {
  const FollowTimelineCustomGanttChart({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<FollowTimelineCubit>();
    return BlocBuilder<FollowTimelineCubit, FollowTimelineState>(
      builder: (context, state) {
        return GanttChartView(
          stickyAreaWeekBuilder: (context) {
            return Container(
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: Colors.black,
                  ),
                  top: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
              child: Visibility(
                visible: !cubit.showDaysRow,
                child: const Text(
                  'اسم النشاط',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            );
          },
          stickyAreaDayBuilder: (context) {
            return Container(
              decoration: const BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
              child: const Text(
                'اسم النشاط',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            );
          },
          maxDuration: const Duration(days: 30 * 2),
          startDate: DateTime(2022, 6, 7),
          dayWidth: cubit.dayWidth,
          eventHeight: 55,
          stickyAreaWidth: 200,
          showStickyArea: cubit.showStickyArea,
          stickyAreaEventBuilder: (context, eventIndex, event, eventColor) {
            return GanttChartDefaultStickyAreaCell(
              event: event,
              eventIndex: eventIndex,
              eventColor: eventColor,
              widgetBuilder: (context) => Text(
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
                  ))
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
          isExtraHoliday: (context, day) {
            //define custom holiday logic for each day
            return DateUtils.isSameDay(DateTime(2022, 7, 1), day);
          },
          startOfTheWeek: WeekDay.sunday,
          events: buildEvents(),
        );
      },
    );
  }

  List<GanttEventBase> buildEvents() {
    List<GanttEventBase> items = [];
    for (int i = 0; i < 10; i++) {
      items.add(
        GanttRelativeEvent(
          relativeToStart: const Duration(days: 0),
          duration: const Duration(days: 5),
          displayName: 'استلام الموقع',
        ),
      );
    }
    return items;
  }
}
