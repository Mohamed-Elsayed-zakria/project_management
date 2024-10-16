abstract class TimelineAttachmentsState {}

final class TimelineAttachmentsInitial extends TimelineAttachmentsState {}

final class AddTimelineTableLoading extends TimelineAttachmentsState {}

final class AddTimelineTableSuccess extends TimelineAttachmentsState {}

final class AddTimelineTableFailure extends TimelineAttachmentsState {
  final String errMessage;
  AddTimelineTableFailure(this.errMessage);
}

final class GetTimelineTableLoading extends TimelineAttachmentsState {}

final class GetTimelineTableSuccess extends TimelineAttachmentsState {}

final class GetTimelineTableFailure extends TimelineAttachmentsState {
  final String errMessage;
  GetTimelineTableFailure(this.errMessage);
}
