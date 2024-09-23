import '/features/show_projects/presentation/manager/project_info_cubit/project_info_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'project_edite_manager_dialog.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class ProjectManagerItem extends StatelessWidget {
  final ProjectDetails projectDetails;

  const ProjectManagerItem({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("مدير المشروع"),
      subtitle: Text(
        projectDetails.projectManager ?? '--',
      ),
      trailing: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => BlocProvider.value(
              value: BlocProvider.of<ProjectInfoCubit>(context),
              child: ProjectEditeManagerDialog(
                projectDetails: projectDetails,
              ),
            ),
          );
        },
        icon: const Icon(
          Icons.edit_outlined,
          color: AppColors.kPrimaryColor,
        ),
      ),
    );
  }
}
