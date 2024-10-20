import '/features/timeline/presentation/manager/follow_timeline_cubit/follow_timeline_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/timeline/data/repository/timeline_implement.dart';
import 'widgets/follow_timeline/follow_timeline_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class FollowTimelineView extends StatelessWidget {
  final ProjectDetails projectDetails;
  const FollowTimelineView({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FollowTimelineCubit(TimelineImplement())..getTimeLineTableFromLocal(projectDetails.id!),
      child: FollowTimelineViewBody(
        projectDetails: projectDetails,
      ),
    );
  }
}
