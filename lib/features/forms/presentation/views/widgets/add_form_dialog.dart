import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/forms/presentation/manager/forms_cubit/forms_cubit.dart';
import '/features/forms/presentation/manager/forms_cubit/forms_state.dart';
import '/features/forms/data/models/add_form_model.dart';
import '/core/widgets/custom_list_tile_validator.dart';
import '/core/widgets/custom_alert_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_form_field.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/models/step_type.dart';
import '/core/routes/app_pages.dart';
import '/core/utils/show_toast.dart';

class AddFormDialog extends StatelessWidget {
  final ProjectDetails projectDetails;
  final StepType stepType;
  const AddFormDialog({
    super.key,
    required this.projectDetails,
    required this.stepType,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<FormsCubit>();
    return CustomAlertDialog(
      title: "اضافة عنصر جديد",
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Form(
            key: cubit.formKeyForms,
            child: Column(
              children: [
                CustomFormField(
                  controller: cubit.formNumberText,
                  label: "رقم النوذج",
                  hintText: "ادخل رقم النوذج",
                  prefixIcon: const Icon(Icons.numbers_outlined),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "مطلوب";
                    } else {
                      return null;
                    }
                  },
                ),
                CustomFormField(
                  controller: cubit.formDescreptionText,
                  label: "وصف النوذج",
                  hintText: "ادخل وصف النوذج",
                  prefixIcon: const Icon(Icons.description_outlined),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "مطلوب";
                    } else {
                      return null;
                    }
                  },
                ),
              ],
            ),
          ),
          BlocBuilder<FormsCubit, FormsState>(
            builder: (context, state) {
              return CustomListTileValidator(
                leading: const Icon(Icons.file_copy_outlined),
                title:
                    cubit.addFormFile == null ? "ارفاق ملف" : "تم ارفاق الملف",
                onTap: () => cubit.pickFormFile(),
              );
            },
          ),
          const SizedBox(height: 10),
          BlocConsumer<FormsCubit, FormsState>(
            listener: (context, state) {
              if (state is AddFormSuccess) {
                cubit.formDescreptionText.clear();
                cubit.formNumberText.clear();
                cubit.addFormFile = null;
                AppPages.back(context);
              }
              if (state is AddFormFailure) {
                ShowToast.show(
                  context: context,
                  msg: state.errMessage,
                );
              }
            },
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddFormLoading,
                text: 'اضافة',
                onPressed: () {
                  if (cubit.formKeyForms.currentState!.validate()) {
                    cubit.addNewForm(
                      newFormData: AddFormModel(
                        formNumber: cubit.formNumberText.text,
                        formDescription: cubit.formDescreptionText.text,
                        formFile: cubit.addFormFile,
                        projectId: projectDetails.id!,
                        stepType: stepType.stepType,
                        stepTypeId: stepType.stepTypeId,
                      ),
                    );
                  }
                },
              );
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
