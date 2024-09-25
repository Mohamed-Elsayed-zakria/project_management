import '/features/show_projects/data/models/project_details/project_details.dart';
import 'package:flutter/material.dart';
import 'widgets/forms_view_body.dart';

class FormsView extends StatelessWidget {
  final ProjectDetails projectDetails;

  const FormsView({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("النماذج"),
        centerTitle: true,
      ),
      body: FormsViewBody(
        projectDetails: projectDetails,
      ),
    );
  }
}
