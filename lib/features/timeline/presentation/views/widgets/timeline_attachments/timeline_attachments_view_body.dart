import '/features/show_projects/data/models/project_details/project_details.dart';
import 'timeline_attachments_header.dart';
import 'package:flutter/material.dart';
import 'custom_linear_progress.dart';

class TimelineAttachmentsViewBody extends StatelessWidget {
  final ProjectDetails projectDetails;

  const TimelineAttachmentsViewBody({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Card(
        elevation: 3,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TimelineAttachmentsHeader(
                projectDetails: projectDetails,
              ),
              const CustomLinearProgress(),
            ],
          ),
        ),
      ),
    );
  }
}
