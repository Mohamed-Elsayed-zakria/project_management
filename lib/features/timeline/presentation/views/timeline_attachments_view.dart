import '/features/timeline/presentation/manager/timeline_attachments_cubit/timeline_attachments_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/timeline/data/repository/timeline_attachments_implement.dart';
import 'widgets/timeline_attachments/timeline_attachments_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class TimelineAttachmentsView extends StatelessWidget {
  final ProjectDetails projectDetails;
  const TimelineAttachmentsView({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimelineAttachmentsCubit(
        TimelineAttachmentsImplement(),
      )..getTimeLineTableFromLocal(projectDetails.id!),
      child: TimelineAttachmentsViewBody(
        projectDetails: projectDetails,
      ),
    );
  }
}
