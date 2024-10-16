abstract class FollowTimelineState {}

final class FollowTimelineInitial extends FollowTimelineState {}

final class FollowTimelineReBuild extends FollowTimelineState {}

final class GetTimelineTableLoading extends FollowTimelineState {}

final class GetTimelineTableSuccess extends FollowTimelineState {}

final class GetTimelineTableFailure extends FollowTimelineState {
  final String errMessage;

  GetTimelineTableFailure(this.errMessage);
}
