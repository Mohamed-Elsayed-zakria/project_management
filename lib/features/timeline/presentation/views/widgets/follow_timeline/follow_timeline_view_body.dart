import '/features/show_projects/data/models/project_details/project_details.dart';
import 'follow_timeline_custom_gantt_chart.dart';
import 'package:flutter/material.dart';
import 'follow_timeline_header.dart';

class FollowTimelineViewBody extends StatelessWidget {
  final ProjectDetails projectDetails;

  const FollowTimelineViewBody({
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                FollowTimelineHeader(
                  projectDetails: projectDetails,
                ),
                const SizedBox(height: 10),
                const FollowTimelineCustomGanttChart(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
