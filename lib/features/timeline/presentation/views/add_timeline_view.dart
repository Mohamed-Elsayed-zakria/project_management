import '/features/show_projects/data/models/project_details/project_details.dart';
import 'package:flutter/material.dart';

class AddTimelineView extends StatelessWidget {
  final ProjectDetails projectDetails;
  const AddTimelineView({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Card(
        elevation: 3,
        color: Colors.white,
      ),
    );
  }
}
