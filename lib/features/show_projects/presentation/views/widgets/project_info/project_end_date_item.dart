import '/features/show_projects/presentation/manager/project_info_cubit/project_info_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class ProjectEndDateItem extends StatelessWidget {
  final ProjectDetails projectDetails;

  const ProjectEndDateItem({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    ProjectInfoCubit cubit = BlocProvider.of<ProjectInfoCubit>(context);
    return ListTile(
      title: const Text("تاريخ انتهاء المشروع"),
      subtitle: Text(
        cubit.calculateProjectEndDate(
          projectDetails: projectDetails,
        ),
      ),
    );
  }
}
