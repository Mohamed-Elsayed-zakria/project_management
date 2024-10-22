import '/features/show_projects/presentation/manager/project_info_cubit/project_info_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'delete_project_dialog.dart';
import '/core/constant/style.dart';

class DeleteProjectButton extends StatelessWidget {
  final ProjectDetails projectDetails;
  final List<ProjectDetails> allProjects;

  const DeleteProjectButton({
    super.key,
    required this.projectDetails,
    required this.allProjects,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ProjectInfoCubit>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: MaterialButton(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => BlocProvider.value(
              value: cubit,
              child: DeleteProjectDialog(
                projectDetails: projectDetails,
                allProjects: allProjects,
              ),
            ),
          );
        },
        color: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            "حذف المشروع",
            style: AppStyle.tabTextStyle.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
