import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_management/core/services/timeline_table_services.dart';
import 'package:project_management/features/timeline/data/models/timeline_structure.dart';
import 'follow_timeline_state.dart';

class FollowTimelineCubit extends Cubit<FollowTimelineState> {
  FollowTimelineCubit() : super(FollowTimelineInitial());

  double dayWidth = 30;
  bool showDaysRow = true;
  bool showStickyArea = true;
  bool customWeekHeader = false;
  bool customDayHeader = false;

  changeShowDaysRow(bool value) {
    showDaysRow = value;
    emit(FollowTimelineReBuild());
  }

  changeShowStickyArea(bool value) {
    showStickyArea = value;
    emit(FollowTimelineReBuild());
  }

  changeCustomWeekHeader(bool value) {
    customWeekHeader = value;
    emit(FollowTimelineReBuild());
  }

  changeCustomDayHeader(bool value) {
    customDayHeader = value;
    emit(FollowTimelineReBuild());
  }

  List<TimelineStructure> timelineTableResult = [];

  Future<void> getTimeLineTableFromLocal(
    String projectId,
  ) async {
    emit(GetTimelineTableLoading());
    try {
      List<TimelineStructure> timelineTable =
          await TimelineTableServices.readTimelineList(
        projectId: projectId,
      );
      emit(GetTimelineTableSuccess());
      timelineTableResult = timelineTable;
    } catch (e) {
      emit(GetTimelineTableFailure(e.toString()));
    }
  }

  Duration maxDuration({
    required List<TimelineStructure> timelineData,
  }) {
    Duration maxDuration = Duration.zero;
    for (var element in timelineData) {
      if (element.start != null && element.finish != null) {
        DateTime startDate = DateTime.parse(element.start!);
        DateTime finishDate = DateTime.parse(element.finish!);
        // Calculate the duration between start and finish
        Duration duration = finishDate.difference(startDate);
        if (duration.inDays > maxDuration.inDays) {
          maxDuration = duration;
        }
      }
    }
    return maxDuration;
  }
}
