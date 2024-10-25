import '/features/show_projects/presentation/manager/project_info_cubit/project_info_state.dart';
import '/features/show_projects/presentation/manager/project_info_cubit/project_info_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_alert_dialog.dart';
import '/core/widgets/custom_form_field.dart';
import '/core/utils/parse_arabic_number.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';

class ProjectEditeValueAddedTaxDialog extends StatelessWidget {
  final ProjectDetails projectDetails;
  const ProjectEditeValueAddedTaxDialog({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    ProjectInfoCubit cubit = BlocProvider.of<ProjectInfoCubit>(context);
    cubit.editeProjectValueAddedTax.text =
        projectDetails.projectValueAddedTax.toString();
    return CustomAlertDialog(
      title: "تعديل ضريبة القيمة المضافة المشروع",
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
                key: cubit.formKeyChangeTax,
                child: CustomFormField(
                  controller: cubit.editeProjectValueAddedTax,
                  label: "ضريبة القيمة المضافة",
                  hintText: "ادخل ضريبة القيمة المضافة الجديدة",
                  validator: (value) {
                    double? projectTax =
                        ParseArabicNumber.parseArabicNumberPrice(
                      cubit.editeProjectValueAddedTax.text,
                    );
                    if (value!.isEmpty) {
                      return "مطلوب";
                    } else if (projectTax == null) {
                      return "خطأ في كتابة القيمة";
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
                  if (cubit.formKeyChangeTax.currentState!.validate()) {
                    cubit.changeProjectValueAddedTax(
                      newTax: double.parse(
                        cubit.editeProjectValueAddedTax.text,
                      ),
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
