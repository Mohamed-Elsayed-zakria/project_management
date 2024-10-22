import '/features/show_projects/presentation/manager/project_info_cubit/project_info_state.dart';
import '/features/show_projects/presentation/manager/project_info_cubit/project_info_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_form_field.dart';
import '/core/utils/parse_arabic_number.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/style.dart';

class ProjectEditeDurationPerDayDialog extends StatelessWidget {
  final ProjectDetails projectDetails;
  const ProjectEditeDurationPerDayDialog({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    ProjectInfoCubit cubit = BlocProvider.of<ProjectInfoCubit>(context);
    cubit.editeDurationPerDay.text =
        projectDetails.projectDurationPerDay.toString();
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      title: const Text(
        "تعديل مدة المشروع باليوم",
        textAlign: TextAlign.center,
        style: AppStyle.kTextStyle20,
      ),
      contentPadding: const EdgeInsets.all(14),
      content: Container(
        constraints: const BoxConstraints(maxWidth: 360),
        child: BlocConsumer<ProjectInfoCubit, ProjectInfoState>(
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
      ),
    );
  }
}
