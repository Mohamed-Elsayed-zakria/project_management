import '/features/show_projects/presentation/manager/project_info_cubit/project_info_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'project_edite_date_po_dialog.dart';
import 'package:flutter/material.dart';
import '/core/utils/my_date_util.dart';
import '/core/constant/colors.dart';

class ProjectDatePoItem extends StatelessWidget {
  final ProjectDetails projectDetails;

  const ProjectDatePoItem({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("تاريخ ال - po"),
      subtitle: Text(
        MyDateUtil.convertDateTime(
          historyAsText: projectDetails.projectDatePo!,
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => BlocProvider.value(
              value: BlocProvider.of<ProjectInfoCubit>(context),
              child: ProjectEditeDatePoDialog(
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
