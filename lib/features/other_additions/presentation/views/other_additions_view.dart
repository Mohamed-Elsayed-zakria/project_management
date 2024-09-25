import '/features/show_projects/data/models/project_details/project_details.dart';
import 'widgets/other_additions_view_body.dart';
import 'package:flutter/material.dart';

class OtherAdditionsView extends StatelessWidget {
  final ProjectDetails projectDetails;
  const OtherAdditionsView({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اضافات اخرى'),
        centerTitle: true,
      ),
      body: OtherAdditionsViewBody(
        projectDetails: projectDetails,
      ),
    );
  }
}
