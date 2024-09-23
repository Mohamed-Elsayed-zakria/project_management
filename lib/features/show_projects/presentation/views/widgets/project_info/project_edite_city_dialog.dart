import '/features/show_projects/presentation/manager/project_info_cubit/project_info_state.dart';
import '/features/show_projects/presentation/manager/project_info_cubit/project_info_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_form_field.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';
import '/core/utils/show_toast.dart';
import '/core/constant/style.dart';

class ProjectEditeCityDialog extends StatelessWidget {
  final ProjectDetails projectDetails;
  const ProjectEditeCityDialog({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    ProjectInfoCubit cubit = BlocProvider.of<ProjectInfoCubit>(context);
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      title: const Text(
        "تعديل مدينة المشروع",
        textAlign: TextAlign.center,
        style: AppStyle.kTextStyle20,
      ),
      contentPadding: const EdgeInsets.all(14),
      content: Container(
        constraints: const BoxConstraints(maxWidth: 360),
        child: BlocConsumer<ProjectInfoCubit, ProjectInfoState>(
          listener: (context, state) {
            if (state is UpdateProjectSuccess) {
              cubit.editeProjectCity.clear();
              AppPages.back(context);
            }
            if (state is UpdateProjectFailure) {
              ShowToast.show(
                context: context,
                msg: state.errMessage,
              );
            }
          },
          builder: (context, state) {
            cubit.editeProjectCity.text = projectDetails.projectCity ?? '';
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                Form(
                  key: cubit.formKeyChangeCity,
                  child: CustomFormField(
                    controller: cubit.editeProjectCity,
                    label: "المدينة",
                    hintText: "ادخل المدينة الجديدة للمشروع",
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
                    if (cubit.formKeyChangeCity.currentState!.validate()) {
                      cubit.changeProjectCity(
                        newCity: cubit.editeProjectCity.text,
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
