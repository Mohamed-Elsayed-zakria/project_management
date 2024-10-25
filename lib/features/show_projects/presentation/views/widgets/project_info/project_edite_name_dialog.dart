import '/features/show_projects/presentation/manager/project_info_cubit/project_info_state.dart';
import '/features/show_projects/presentation/manager/project_info_cubit/project_info_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import '/core/widgets/custom_alert_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_form_field.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';

class ProjectEditeNameDialog extends StatelessWidget {
  final ProjectDetails projectDetails;
  const ProjectEditeNameDialog({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ProjectInfoCubit>();
    cubit.editeProjectName.text = projectDetails.projectName ?? "";
    return CustomAlertDialog(
      title: "تعديل اسم المشروع",
      content: BlocConsumer<ProjectInfoCubit, ProjectInfoState>(
        listener: (context, state) {
          if (state is UpdateProjectSuccess) {
            AppPages.back(context);
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Form(
                key: cubit.formKeyChangeName,
                child: CustomFormField(
                  controller: cubit.editeProjectName,
                  label: "اسم المشروع",
                  hintText: "ادخل اسم المشروع الجديد",
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
                isLoading: state is UpdateProjectLoading,
                text: 'تعديل',
                onPressed: () {
                  if (cubit.formKeyChangeName.currentState!.validate()) {
                    cubit.changeProjectName(
                      newName: cubit.editeProjectName.text,
                      projectDetails: projectDetails,
                    );
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
