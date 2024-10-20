import '/features/timeline/data/models/timeline_structure.dart';
import '/features/timeline/data/repository/timeline_repo.dart';
import '/core/services/timeline_table_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'timeline_attachments_state.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class TimelineAttachmentsCubit extends Cubit<TimelineAttachmentsState> {
  final TimelineRepo _timelineRepo;
  TimelineAttachmentsCubit(this._timelineRepo)
      : super(TimelineAttachmentsInitial());

  List<TimelineStructure> timelineTableResult = [];
  List<TimelineStructure> originalTimelineTable = [];

  int itemsCount = 60;
  int currentOffset = 0;

  Future<void> addTimeLineTable({
    required String projectId,
  }) async {
    Either<Failures, List<TimelineStructure>> result =
        await _timelineRepo.addTimeLineTable(
      projectId: projectId,
    );
    result.fold(
      (failures) => emit(
        AddTimelineTableFailure(failures.errMessage),
      ),
      (result) {
        originalTimelineTable = result;
        loadMoreEvents(itemsCount);
        emit(AddTimelineTableSuccess());
      },
    );
  }

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
        originalTimelineTable = result;
        loadMoreEvents(itemsCount);
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
        originalTimelineTable = timelineTable;
        loadMoreEvents(itemsCount);
      }
    } catch (e) {
      emit(GetTimelineTableFailure(e.toString()));
    }
  }

  void loadMoreEvents(int count) {
    if (currentOffset >= originalTimelineTable.length) return;

    int remainingItems = originalTimelineTable.length - currentOffset;
    int loadCount = remainingItems >= count ? count : remainingItems;

    timelineTableResult.addAll(
      originalTimelineTable.sublist(
        currentOffset,
        currentOffset + loadCount,
      ),
    );

    currentOffset += loadCount;
    emit(GetTimelineTableSuccess());
  }
}
