import '/features/show_projects/presentation/manager/project_info_cubit/project_info_state.dart';
import '/features/show_projects/presentation/manager/project_info_cubit/project_info_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_form_field.dart';
import '/core/utils/parse_arabic_number.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';
import '/core/utils/show_toast.dart';
import '/core/constant/style.dart';

class ProjectEditePriceDialog extends StatelessWidget {
  final ProjectDetails projectDetails;
  const ProjectEditePriceDialog({
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
        "تعديل مبلغ المشروع",
        textAlign: TextAlign.center,
        style: AppStyle.kTextStyle20,
      ),
      contentPadding: const EdgeInsets.all(14),
      content: Container(
        constraints: const BoxConstraints(maxWidth: 360),
        child: BlocConsumer<ProjectInfoCubit, ProjectInfoState>(
          listener: (context, state) {
            if (state is UpdateProjectSuccess) {
              cubit.editeProjectPrice.clear();
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
            cubit.editeProjectPrice.text =
                projectDetails.projectPrice.toString();
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                Form(
                  key: cubit.formKeyChangePrice,
                  child: CustomFormField(
                    controller: cubit.editeProjectPrice,
                    label: "مبلغ المشروع",
                    hintText: "ادخل المبلغ الجديد للمشروع",
                    validator: (value) {
                      int? projectPrice = ParseArabicNumber.parseArabicNumber(
                        cubit.editeProjectPrice.text,
                      );
                      if (value!.isEmpty) {
                        return "مطلوب";
                      } else if (projectPrice == null) {
                        return "خطأ في كتابة السعر";
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
                    if (cubit.formKeyChangePrice.currentState!.validate()) {
                      cubit.changeProjectPrice(
                        newPrice: double.parse(cubit.editeProjectPrice.text),
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
