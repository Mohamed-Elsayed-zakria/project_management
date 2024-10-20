abstract class FollowTimelineState {}

final class FollowTimelineInitial extends FollowTimelineState {}

final class FollowTimelineReBuild extends FollowTimelineState {}

final class LoadMoreEvents extends FollowTimelineState {}

final class RemoveEventsAbove extends FollowTimelineState {}

final class AddEventsAbove extends FollowTimelineState {}

final class GetTimelineTableLoading extends FollowTimelineState {}

final class GetTimelineTableSuccess extends FollowTimelineState {}

final class GetTimelineTableFailure extends FollowTimelineState {
  final String errMessage;

  GetTimelineTableFailure(this.errMessage);
}
