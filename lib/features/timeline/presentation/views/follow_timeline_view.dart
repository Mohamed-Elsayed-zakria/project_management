import '/features/show_projects/data/models/project_details/project_details.dart';
import 'package:gantt_chart/gantt_chart.dart';
import 'package:flutter/material.dart';

class FollowTimelineView extends StatefulWidget {
  final ProjectDetails projectDetails;
  const FollowTimelineView({
    super.key,
    required this.projectDetails,
  });

  @override
  State<FollowTimelineView> createState() => _FollowTimelineViewState();
}

class _FollowTimelineViewState extends State<FollowTimelineView> {
  double dayWidth = 30;
  bool showDaysRow = true;
  bool showStickyArea = true;
  bool customWeekHeader = false;
  bool customDayHeader = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Card(
        elevation: 3,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SwitchListTile.adaptive(
                  value: showDaysRow,
                  title: const Text('عرض الأيام'),
                  onChanged: (v) => setState(() => showDaysRow = v),
                ),
                SwitchListTile.adaptive(
                  value: showStickyArea,
                  title: const Text('عرض اسم النشاط'),
                  onChanged: (v) => setState(() => showStickyArea = v),
                ),
                SwitchListTile.adaptive(
                  value: customWeekHeader,
                  title: const Text('تحديد التاريخ'),
                  onChanged: (v) => setState(() => customWeekHeader = v),
                ),
                SwitchListTile.adaptive(
                  value: customDayHeader,
                  title: const Text('تحديد الأيام'),
                  onChanged: (v) => setState(() => customDayHeader = v),
                ),
                const Divider(),
                const SizedBox(height: 10),
                GanttChartView(
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
                        visible: !showDaysRow,
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
                  dayWidth: dayWidth,
                  eventHeight: 55,
                  stickyAreaWidth: 200,
                  showStickyArea: showStickyArea,
                  stickyAreaEventBuilder:
                      (context, eventIndex, event, eventColor) {
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
                  weekHeaderBuilder: customWeekHeader
                      ? (context, weekDate) => GanttChartDefaultWeekHeader(
                          weekDate: weekDate,
                          color: Colors.black,
                          backgroundColor: Colors.yellow,
                          border: const BorderDirectional(
                            end: BorderSide(color: Colors.green),
                          ))
                      : null,
                  dayHeaderBuilder: customDayHeader
                      ? (context, date, bool isHoliday) =>
                          GanttChartDefaultDayHeader(
                            date: date,
                            isHoliday: isHoliday,
                            color: isHoliday ? Colors.yellow : Colors.black,
                            backgroundColor:
                                isHoliday ? Colors.grey : Colors.yellow,
                          )
                      : null,
                  showDays: showDaysRow,
                  weekEnds: const {WeekDay.friday, WeekDay.saturday},
                  isExtraHoliday: (context, day) {
                    //define custom holiday logic for each day
                    return DateUtils.isSameDay(DateTime(2022, 7, 1), day);
                  },
                  startOfTheWeek: WeekDay.sunday,
                  events: [
                    GanttRelativeEvent(
                      relativeToStart: const Duration(days: 0),
                      duration: const Duration(days: 5),
                      displayName: 'استلام الموقع',
                    ),
                    GanttRelativeEvent(
                      relativeToStart: const Duration(days: 1),
                      duration: const Duration(days: 6),
                      displayName: 'بداية مرحلة التنفيذ',
                    ),
                    GanttRelativeEvent(
                      relativeToStart: const Duration(days: 2),
                      duration: const Duration(days: 7),
                      displayName: 'بداية مرحلة الاختبار والتشغيل التجريبي',
                    ),
                    GanttRelativeEvent(
                      relativeToStart: const Duration(days: 3),
                      duration: const Duration(days: 8),
                      displayName: 'نهاية مرحلة التنفيذ',
                    ),
                    GanttRelativeEvent(
                      relativeToStart: const Duration(days: 4),
                      duration: const Duration(days: 9),
                      displayName: 'نهاية مرحلة الاختبار والتشغيل التجريبي',
                    ),
                    GanttRelativeEvent(
                      relativeToStart: const Duration(days: 5),
                      duration: const Duration(days: 10),
                      displayName: 'بداية مرحلة الاغلاق',
                    ),
                    GanttRelativeEvent(
                      relativeToStart: const Duration(days: 6),
                      duration: const Duration(days: 11),
                      displayName: 'نهاية المشروع',
                    ),
                    GanttAbsoluteEvent(
                      displayName: 'Absoulte Date event',
                      startDate: DateTime(2022, 6, 7),
                      endDate: DateTime(2022, 6, 20),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
