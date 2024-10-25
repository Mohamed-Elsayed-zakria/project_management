import '/features/show_projects/presentation/manager/project_info_cubit/project_info_state.dart';
import '/features/show_projects/presentation/manager/project_info_cubit/project_info_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import '/core/widgets/custom_alert_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_form_field.dart';
import '/core/utils/parse_arabic_number.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';

class ProjectEditeDurationPerDayDialog extends StatelessWidget {
  final ProjectDetails projectDetails;
  const ProjectEditeDurationPerDayDialog({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ProjectInfoCubit>();
    cubit.editeDurationPerDay.text =
        projectDetails.projectDurationPerDay.toString();
    return CustomAlertDialog(
      title: "تعديل مدة المشروع باليوم",
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
                key: cubit.formKeyChangeDurationPerDay,
                child: CustomFormField(
                  controller: cubit.editeDurationPerDay,
                  label: "مدة المشروع باليوم",
                  hintText: "ادخل المدة الجديدة باليوم",
                  validator: (value) {
                    int? projectNewDuration =
                        ParseArabicNumber.parseArabicNumber(
                      cubit.editeDurationPerDay.text,
                    );
                    if (value!.isEmpty) {
                      return "مطلوب";
                    } else if (projectNewDuration == null) {
                      return "خطأ في كتابة المدة";
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
                  if (cubit.formKeyChangeDurationPerDay.currentState!
                      .validate()) {
                    cubit.changeDurationPerDay(
                      newDuration: int.parse(cubit.editeDurationPerDay.text),
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
