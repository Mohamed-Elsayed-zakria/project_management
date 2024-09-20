import '/features/show_projects/presentation/manager/project_info_cubit/project_info_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'widgets/project_info/project_info_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ProjectInfoView extends StatelessWidget {
  final ProjectDetails projectDetails;
  const ProjectInfoView({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("معلومات المشروع"),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => ProjectInfoCubit(),
        child: ProjectInfoViewBody(
          projectDetails: projectDetails,
        ),
      ),
    );
  }
}
