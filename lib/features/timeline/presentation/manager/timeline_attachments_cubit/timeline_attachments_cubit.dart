import 'package:project_management/core/services/timeline_table_services.dart';
import '/features/timeline/data/repository/timeline_attachments_repo.dart';
import '/features/timeline/data/models/timeline_structure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'timeline_attachments_state.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class TimelineAttachmentsCubit extends Cubit<TimelineAttachmentsState> {
  final TimelineAttachmentsRepo _attachmentsRepo;
  TimelineAttachmentsCubit(this._attachmentsRepo)
      : super(TimelineAttachmentsInitial());

  List<TimelineStructure> timelineTableResult = [];

  Future<void> addTimeLineTable({
    required String projectId,
  }) async {
    Either<Failures, List<TimelineStructure>> result =
        await _attachmentsRepo.addTimeLineTable(
      projectId: projectId,
    );
    result.fold(
      (failures) => emit(
        AddTimelineTableFailure(failures.errMessage),
      ),
      (result) {
        timelineTableResult = result;
        emit(AddTimelineTableSuccess());
      },
    );
  }

  Future<void> getTimeLineTable({
    required String projectId,
  }) async {
    emit(GetTimelineTableLoading());
    Either<Failures, List<TimelineStructure>> result =
        await _attachmentsRepo.getTimeLineTable(
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
      timelineTableResult = timelineTable;
    } catch (e) {
      emit(GetTimelineTableFailure(e.toString()));
    }
  }
}
