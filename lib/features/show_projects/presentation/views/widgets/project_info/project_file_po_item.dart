import '/features/show_projects/presentation/manager/project_info_cubit/project_info_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/constant/api_end_point.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class ProjectFilePoItem extends StatelessWidget {
  final ProjectDetails projectDetails;

  const ProjectFilePoItem({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    ProjectInfoCubit cubit = BlocProvider.of<ProjectInfoCubit>(context);

    return ListTile(
      title: const Text("ملف ال - po"),
      trailing: IconButton(
        icon: const Icon(
          Icons.visibility_outlined,
          color: AppColors.kPrimaryColor,
        ),
        onPressed: () async {
          await cubit.openFile(
            "${APIEndPoint.mediaBaseUrl}${projectDetails.projectFilePo}",
          );
        },
      ),
    );
  }
}
