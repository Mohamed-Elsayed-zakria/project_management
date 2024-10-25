import '/features/show_projects/presentation/manager/project_info_cubit/project_info_cubit.dart';
import '/features/show_projects/presentation/manager/project_info_cubit/project_info_state.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import '/core/widgets/custom_alert_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_form_field.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';

class DeleteProjectDialog extends StatelessWidget {
  final ProjectDetails projectDetails;
  final List<ProjectDetails> allProjects;

  const DeleteProjectDialog({
    super.key,
    required this.projectDetails,
    required this.allProjects,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ProjectInfoCubit>(context);
    return CustomAlertDialog(
      title: "حذف المشروع",
      content: BlocConsumer<ProjectInfoCubit, ProjectInfoState>(
        listener: (context, state) {
          if (state is DeleteProjectSuccess) {
            cubit.deleteProjectController.clear();
            AppPages.back(context);
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Form(
                key: cubit.formKeyDeleteProject,
                child: CustomFormField(
                  controller: cubit.deleteProjectController,
                  label: "رقم المشروع",
                  hintText: "ادخل رقم المشروع للتأكيد",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "مطلوب";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              const SizedBox(height: 10),
              CustomButton(
                isLoading: state is DeleteProjectLoading,
                text: 'حذف',
                onPressed: () {
                  if (cubit.formKeyDeleteProject.currentState!.validate()) {
                    if (cubit.deleteProjectController.text ==
                        projectDetails.projectNumber) {
                      cubit.deleteProject(
                        projectDetails: projectDetails,
                        allProjects: allProjects,
                      );
                    }
                  }
                },
              ),
              const SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }
}
