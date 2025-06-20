import '/features/show_projects/presentation/manager/project_info_cubit/project_info_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/show_projects/data/repository/project_info_implement.dart';
import 'widgets/project_info/project_info_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ProjectInfoView extends StatelessWidget {
  final ProjectDetails projectDetails;
  final List<ProjectDetails> allProjects;

  const ProjectInfoView({
    super.key,
    required this.projectDetails,
    required this.allProjects,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("معلومات المشروع"),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => ProjectInfoCubit(
          ProjectInfoImplement(),
        ),
        child: ProjectInfoViewBody(
          projectDetails: projectDetails,
          allProjects: allProjects,
        ),
      ),
    );
  }
}
