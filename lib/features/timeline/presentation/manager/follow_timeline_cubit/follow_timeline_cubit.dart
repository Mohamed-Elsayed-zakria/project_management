import '/features/timeline/data/models/timeline_structure.dart';
import '/features/timeline/data/repository/timeline_repo.dart';
import '/core/services/timeline_table_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/errors/failures.dart';
import 'follow_timeline_state.dart';
import 'package:dartz/dartz.dart';

class FollowTimelineCubit extends Cubit<FollowTimelineState> {
  final TimelineRepo _timelineRepo;
  FollowTimelineCubit(this._timelineRepo) : super(FollowTimelineInitial());

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

  Future<void> getTimeLineTableFromClaude({
    required String projectId,
  }) async {
    emit(GetTimelineTableLoading());
    Either<Failures, List<TimelineStructure>> result =
        await _timelineRepo.getTimeLineTableFromClaude(
      projectId: projectId,
    );
    result.fold(
      (failures) => emit(
        GetTimelineTableFailure(failures.errMessage),
      ),
      (result) {
        timelineTableResult = result;
        emit(GetTimelineTableSuccess());
      },
    );
  }

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
      if (timelineTable.isEmpty) {
        getTimeLineTableFromClaude(projectId: projectId);
      } else {
        timelineTableResult = timelineTable;
      }
    } catch (e) {
      emit(GetTimelineTableFailure(e.toString()));
    }
  }

  DateTime? startDate({
    required List<TimelineStructure> timelineData,
  }) {
    DateTime? earliestDate;
    for (var element in timelineData) {
      if (element.start != null) {
        DateTime? startDate;
        try {
          startDate = DateTime.parse(element.start!);
        } catch (e) {
          continue;
        }
        if (earliestDate == null || startDate.isBefore(earliestDate)) {
          earliestDate = startDate;
        }
      }
    }
    return earliestDate;
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
