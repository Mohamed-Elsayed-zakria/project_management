import '/features/show_projects/presentation/manager/project_info_cubit/project_info_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'project_edite_receipt_date_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/utils/my_date_util.dart';
import '/core/constant/colors.dart';

class ProjectReceiptDateItem extends StatelessWidget {
  final ProjectDetails projectDetails;

  const ProjectReceiptDateItem({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("تاريخ استلام المشروع"),
      subtitle: Text(
        MyDateUtil.convertDateTime(
          historyAsText: projectDetails.projectReceiptDate!,
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => BlocProvider.value(
              value: BlocProvider.of<ProjectInfoCubit>(context),
              child: ProjectEditeReceiptDateDialog(
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
