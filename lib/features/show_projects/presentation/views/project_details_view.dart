import 'widgets/project_details_view_body.dart';
import 'package:flutter/material.dart';

class ProjectDetailsView extends StatelessWidget {
  const ProjectDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تفاصيل المشروع"),
        centerTitle: true,
      ),
      body: const ProjectDetailsViewBody(),
    );
  }
}
