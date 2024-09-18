import 'widgets/project_info/project_info_view_body.dart';
import 'package:flutter/material.dart';

class ProjectInfoView extends StatelessWidget {
  const ProjectInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("معلومات المشروع"),
        centerTitle: true,
      ),
      body: const ProjectInfoViewBody(),
    );
  }
}
