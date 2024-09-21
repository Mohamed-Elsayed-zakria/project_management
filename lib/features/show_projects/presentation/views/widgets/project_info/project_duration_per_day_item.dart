import '/features/show_projects/presentation/manager/project_info_cubit/project_info_cubit.dart';
import '/features/show_projects/presentation/manager/project_info_cubit/project_info_state.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'project_edite_duration_per_day_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class ProjectDurationPerDayItem extends StatelessWidget {
  final ProjectDetails projectDetails;

  const ProjectDurationPerDayItem({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    ProjectInfoCubit cubit = BlocProvider.of<ProjectInfoCubit>(context);
    return BlocBuilder<ProjectInfoCubit, ProjectInfoState>(
      builder: (context, state) {
        return ListTile(
          title: const Text("مدة المشروع باليوم"),
          subtitle: Text(
            projectDetails.projectDurationPerDay?.toString() ?? '--',
          ),
          trailing: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => BlocProvider.value(
                  value: cubit,
                  child: ProjectEditeDurationPerDayDialog(
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
      },
    );
  }
}
