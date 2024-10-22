import '/features/show_projects/presentation/manager/project_info_cubit/project_info_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'project_edit_holidays_dialog.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class ProjectHolidaysItem extends StatelessWidget {
  final ProjectDetails projectDetails;
  const ProjectHolidaysItem({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ProjectInfoCubit>();
    return ListTile(
      title: const Text("الاجازات الرسمية"),
      subtitle: Text(
        projectDetails.holidays!.isNotEmpty
            ? projectDetails.holidays!.join(", ")
            : "--",
      ),
      trailing: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => BlocProvider.value(
              value: cubit,
              child: ProjectEditHolidaysDialog(
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
