import '/features/show_projects/presentation/manager/project_info_cubit/project_info_cubit.dart';
import '/features/show_projects/presentation/manager/project_info_cubit/project_info_state.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_form_field.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/style.dart';

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
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      title: const Text(
        "حذف المشروع",
        textAlign: TextAlign.center,
        style: AppStyle.kTextStyle20,
      ),
      contentPadding: const EdgeInsets.all(14),
      content: Container(
        constraints: const BoxConstraints(maxWidth: 360),
        child: BlocConsumer<ProjectInfoCubit, ProjectInfoState>(
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
      ),
    );
  }
}
