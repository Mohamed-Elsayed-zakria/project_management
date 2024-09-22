import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/show_projects/presentation/manager/boq_cubit/boq_cubit.dart';
import 'project_details_create_new_boq_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class ProjectDetailsCreateNewBoqButton extends StatelessWidget {
  final ProjectDetails projectDetails;

  const ProjectDetailsCreateNewBoqButton({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => BlocProvider.value(
            value: BlocProvider.of<BoqCubit>(context),
            child: ProjectDetailsCreateNewBoqDialog(
              projectDetails: projectDetails,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "اضافة جدول معدل جديد",
          style: AppStyle.tabTextStyle.copyWith(
            color: AppColors.kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
