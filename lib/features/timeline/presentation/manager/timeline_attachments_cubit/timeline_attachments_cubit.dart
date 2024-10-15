import '/features/timeline/data/repository/timeline_attachments_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'timeline_attachments_state.dart';
import '/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

class TimelineAttachmentsCubit extends Cubit<TimelineAttachmentsState> {
  final TimelineAttachmentsRepo _attachmentsRepo;
  TimelineAttachmentsCubit(this._attachmentsRepo)
      : super(TimelineAttachmentsInitial());

  Future<void> addTimeLineTable({
    required String projectId,
  }) async {
    Either<Failures, void> result = await _attachmentsRepo.addTimeLineTable(
      projectId: projectId,
    );
    result.fold(
      (failures) => emit(
        AddTimelineTableFailure(failures.errMessage),
      ),
      (result) => emit(AddTimelineTableSuccess()),
    );
  }
}
