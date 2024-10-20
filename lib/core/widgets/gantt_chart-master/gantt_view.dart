import 'package:flutter/material.dart';
import 'event.dart';
import 'gantt_default_day_header.dart';
import 'gantt_default_event_row_per_week.dart';
import 'gantt_default_sticky_area_cell.dart';
import 'gantt_default_week_header.dart';
import 'scrolling_list.dart';
import 'week_day.dart';
import 'package:collection/collection.dart';

typedef IsExtraHolidayFunc = bool Function(BuildContext context, DateTime date);
typedef EventCellBuilderFunction = Widget Function(
  BuildContext context,
  DateTime eventStart,
  DateTime eventEnd,
  bool isHoliday,
  GanttEventBase event,
  DateTime day,
  Color eventColor,
);

/// Displays a gantt chart
class GanttChartView extends StatefulWidget {
  GanttChartView({
    super.key,
    required this.events,
    required this.startDate,
    this.maxDuration,
    this.stickyAreaWidth = 200,
    this.stickyAreaEventBuilder,
    this.stickyAreaDayBuilder,
    this.stickyAreaWeekBuilder,
    this.showDays = true,
    this.dayWidth = 30,
    this.eventHeight = 30,
    this.weekHeaderHeight = 30,
    this.dayHeaderHeight = 40,
    this.weekEnds = const {WeekDay.friday, WeekDay.saturday},
    this.dayHeaderBuilder,
    this.weekHeaderBuilder,
    this.isExtraHoliday,
    this.eventRowPerWeekBuilder,
    this.startOfTheWeek = WeekDay.sunday,
    this.eventCellPerDayBuilder,
    this.holidayColor,
    this.showStickyArea = true,
    this.scrollController,
    this.scrollPhysics,
  }) : assert(
          !weekEnds.contains(startOfTheWeek),
          'startOfTheWeek must be a work day',
        );

  /// The horizontal scroll controller that gets passed to the internal listview
  final ScrollController? scrollController;

  /// The horizontal scroll physics that gets passed to the internal listview
  final ScrollPhysics? scrollPhysics;

  /// Custom builder for sticky area per event
  ///
  /// default([GanttChartDefaultStickyAreaCell])
  final Widget Function(
    BuildContext context,
    int eventIndex,
    GanttEventBase event,
    Color eventColor,
  )? stickyAreaEventBuilder;

  /// Custom builder for sticky area as a header for the weeks row
  ///
  /// default(`null`)
  final WidgetBuilder? stickyAreaWeekBuilder;

  /// Custom builder for sticky area as a header for the days row
  ///
  /// default(`null`)
  final WidgetBuilder? stickyAreaDayBuilder;

  /// Color to mark holiday
  ///
  /// default(`null`)
  final Color? holidayColor;

  /// Initial datetime
  final DateTime startDate;

  /// Maximum duration that will be displayed by the gantt chart
  final Duration? maxDuration;

  /// override this to check if specific date is a holiday
  final IsExtraHolidayFunc? isExtraHoliday;

  /// list of events
  final List<GanttEventBase> events;

  /// show days row
  final bool showDays;

  /// the week header builder (gets called for every week)
  ///
  /// [weekDate] is the start of the week, which will always be a [startOfTheWeek]
  final Widget Function(BuildContext context, DateTime weekDate)?
      weekHeaderBuilder;

  /// Show sticky row headers on the left
  final bool showStickyArea;

  /// Sticky area width
  final double stickyAreaWidth;

  /// the day header builder
  final Widget Function(BuildContext context, DateTime date, bool isHoliday)?
      dayHeaderBuilder;

  /// Custom builder for the event row per week
  ///
  /// default([GanttChartDefaultEventRowPerWeekBuilder])
  final Widget Function(
    BuildContext context,
    DateTime eventStart,
    DateTime eventEnd,
    double dayWidth,
    double weekWidth,
    DateTime weekStartDate,
    bool Function(BuildContext, DateTime) isHoliday,
    GanttEventBase event,
    Color eventColor,
  )? eventRowPerWeekBuilder;

  /// Custom builder for the event cell per day
  ///
  /// default([GanttChartDefaultEventRowPerDayBuilder])
  final EventCellBuilderFunction? eventCellPerDayBuilder;

  /// a set of [WeekDay]s which are considered holidays that occur every week
  ///
  /// by default are [WeekDay.friday], [WeekDay.saturday]
  final Set<WeekDay> weekEnds;

  /// First workday of the week, by default [WeekDay.sunday]
  final WeekDay startOfTheWeek;

  /// Day column width (in pixels)
  final double dayWidth;

  /// Event row height (in pixels)
  final double eventHeight;

  /// Week header row height (in pixels)
  final double weekHeaderHeight;

  /// Day header row height (in pixels)
  final double dayHeaderHeight;

  @override
  State<GanttChartView> createState() => GanttChartViewState();
}

class GanttChartViewState extends State<GanttChartView> {
  late ScrollController controller; // = ScrollController();
  final extraHolidayCache = <DateTime>{};

  Set<WeekDay> get weekEnds => widget.weekEnds;

  double get weekWidth => widget.dayWidth * 7;

  WeekDay get startOfTheWeek => widget.startOfTheWeek;

  late DateTime startDate;
  late DateTime weekOfStartDate;

  double durationToWeekOffset(Duration duration) {
    final inWeeks = duration.inDays ~/ 7;
    return inWeeks * weekWidth;
  }

  DateTime getWeekOf(DateTime date) {
    var targetWeekday = WeekDay.fromDateTime(date);
    var diff = -((targetWeekday.number - startOfTheWeek.number) % 7);
    return date.add(Duration(days: diff));
  }

  final eventColors = <Color>[];
  void initFromCurrentWidget() {
    eventColors.clear();
    eventColors.addAll(widget.events.mapIndexed((index, element) =>
        element.suggestedColor ??
        Colors.primaries[index % Colors.primaries.length]));
    controller = widget.scrollController ?? ScrollController();
    startDate = DateUtils.dateOnly(widget.startDate);
    weekOfStartDate = getWeekOf(startDate);
  }

  late final ScrollController _controllerLeft;
  late final ScrollController _controllerRight;
  var scrollingList = ScrollingList.none;

  @override
  void initState() {
    super.initState();
    _controllerLeft = ScrollController();
    _controllerRight = ScrollController();
    initFromCurrentWidget();
  }

  @override
  void didUpdateWidget(covariant GanttChartView oldWidget) {
    super.didUpdateWidget(oldWidget);
    final newScrollController = widget.scrollController;
    final oldScrollController = oldWidget.scrollController;
    if (newScrollController != oldScrollController &&
        oldScrollController == null) {
      //moves from null to not-null, dispose self-created controller
      controller.dispose();
    }
    initFromCurrentWidget();
  }

  @override
  void dispose() {
    if (widget.scrollController == null) {
      // dispose self-created controller
      controller.dispose();
    }
    super.dispose();
  }

  bool isHolidayCached(BuildContext context, DateTime date) {
    if (weekEnds.contains(WeekDay.fromDateTime(date))) return true;

    final dateOnly = DateUtils.dateOnly(date);
    if (extraHolidayCache.contains(dateOnly)) return true;
    if (widget.isExtraHoliday?.call(context, dateOnly) == true) {
      extraHolidayCache.add(dateOnly);
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showStickyArea)
          SizedBox(
            width: widget.stickyAreaWidth,
            child: Column(
              children: [
                Expanded(
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      if (notification is ScrollStartNotification) {
                        if (scrollingList == ScrollingList.none) {
                          scrollingList = ScrollingList.left;
                        }
                      } else if (notification is ScrollEndNotification) {
                        if (scrollingList == ScrollingList.left) {
                          scrollingList = ScrollingList.none;
                        }
                      }
                      if (scrollingList == ScrollingList.left) {
                        _controllerRight.jumpTo(_controllerLeft.offset);
                      }
                      return true;
                    },
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context)
                          .copyWith(scrollbars: false),
                      child: ListView.builder(
                        controller: _controllerLeft,
                        itemCount: widget.events.length + 1,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(
                                  height: widget.weekHeaderHeight,
                                  child: widget.stickyAreaWeekBuilder
                                      ?.call(context),
                                ),
                                if (widget.showDays)
                                  SizedBox(
                                    height: widget.dayHeaderHeight,
                                    child: widget.stickyAreaDayBuilder
                                        ?.call(context),
                                  ),
                              ],
                            );
                          }
                          final eventColor = eventColors[index - 1];
                          final event = widget.events[index - 1];
                          return SizedBox(
                            height: widget.eventHeight,
                            child: widget.stickyAreaEventBuilder?.call(
                                  context,
                                  index - 1,
                                  event,
                                  eventColor,
                                ) ??
                                GanttChartDefaultStickyAreaCell(
                                  event: event,
                                  eventIndex: index - 1,
                                  eventColor: eventColor,
                                ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        Expanded(
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollStartNotification) {
                if (scrollingList == ScrollingList.none) {
                  scrollingList = ScrollingList.right;
                }
              } else if (notification is ScrollEndNotification) {
                if (scrollingList == ScrollingList.right) {
                  scrollingList = ScrollingList.none;
                }
              }
              if (scrollingList == ScrollingList.right) {
                _controllerLeft.jumpTo(_controllerRight.offset);
              }
              return true;
            },
            child: SingleChildScrollView(
              controller: _controllerRight,
              child: SizedBox(
                height: widget.weekHeaderHeight +
                    (widget.showDays ? widget.dayHeaderHeight : 0) +
                    (widget.eventHeight * widget.events.length),
                child: ListView.builder(
                  physics: widget.scrollPhysics,
                  itemExtent: weekWidth,
                  scrollDirection: Axis.horizontal,
                  controller: controller,
                  itemCount: widget.maxDuration == null
                      ? null
                      : (widget.maxDuration!.inDays / 7).ceil(),
                  itemBuilder: (context, index) {
                    //map index to week

                    //1) get week of startDate
                    final date = startDate.add(Duration(days: index * 7));
                    final weekDate = getWeekOf(date);
                    return Column(
                      key: ValueKey(weekDate),
                      children: [
                        //Week Header row
                        SizedBox(
                          height: widget.weekHeaderHeight,
                          width: weekWidth,
                          child: widget.weekHeaderBuilder
                                  ?.call(context, weekDate) ??
                              GanttChartDefaultWeekHeader(
                                weekDate: weekDate,
                              ),
                        ),
                        if (widget.showDays)
                          SizedBox(
                            height: widget.dayHeaderHeight,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: DateTime.daysPerWeek,
                              itemBuilder: (context, i) {
                                final day = weekDate.add(Duration(days: i));
                                final isHoliday = isHolidayCached(context, day);
                                //Header row
                                return SizedBox(
                                  width: widget.dayWidth,
                                  child: widget.dayHeaderBuilder
                                          ?.call(context, day, isHoliday) ??
                                      GanttChartDefaultDayHeader(
                                        date: day,
                                        isHoliday: isHoliday,
                                      ),
                                );
                              },
                            ),
                          ),

                        //Body
                        Expanded(
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.events.length,
                            prototypeItem: SizedBox(
                              height: widget.eventHeight,
                              child: widget.eventRowPerWeekBuilder?.call(
                                    context,
                                    DateTime.now(),
                                    DateTime.now(),
                                    widget.dayWidth,
                                    weekWidth,
                                    weekDate,
                                    isHolidayCached,
                                    widget.events[0],
                                    Colors.black,
                                  ) ??
                                  GanttChartDefaultEventRowPerWeekBuilder(
                                    eventEndDate: DateTime.now(),
                                    eventStartDate: DateTime.now(),
                                    dayWidth: widget.dayWidth,
                                    event: widget.events[0],
                                    isHolidayFunc: isHolidayCached,
                                    weekDate: weekDate,
                                    func: widget.eventCellPerDayBuilder,
                                    holidayColor: widget.holidayColor,
                                    eventColor: Colors.black,
                                  ),
                            ),
                            itemBuilder: (context, indexBody) {
                              final e = widget.events[indexBody];
                              final actStartDate = e.getStartDateInclusive(
                                context,
                                startDate,
                                weekEnds,
                                isHolidayCached,
                              );
                              final actEndDate = e.getEndDateExeclusive(
                                context,
                                actStartDate,
                                weekEnds,
                                isHolidayCached,
                              );

                              final eventColor = eventColors[indexBody];

                              return Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom:
                                        indexBody == widget.events.length - 1
                                            ? const BorderSide()
                                            : BorderSide.none,
                                  ),
                                ),
                                height: widget.eventHeight,
                                child: widget.eventRowPerWeekBuilder?.call(
                                      context,
                                      actStartDate,
                                      actEndDate,
                                      widget.dayWidth,
                                      weekWidth,
                                      weekDate,
                                      isHolidayCached,
                                      e,
                                      eventColor,
                                    ) ??
                                    GanttChartDefaultEventRowPerWeekBuilder(
                                      eventEndDate: actEndDate,
                                      eventStartDate: actStartDate,
                                      dayWidth: widget.dayWidth,
                                      event: e,
                                      isHolidayFunc: isHolidayCached,
                                      weekDate: weekDate,
                                      func: widget.eventCellPerDayBuilder,
                                      holidayColor: widget.holidayColor,
                                      eventColor: eventColor,
                                    ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
