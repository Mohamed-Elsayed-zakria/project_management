import 'package:flutter_bloc/flutter_bloc.dart';
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
}
