import '/features/other_additions/presentation/manager/other_additions_cubit/other_additions_cubit.dart';
import '/features/other_additions/presentation/manager/other_additions_cubit/other_additions_state.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/other_additions/data/models/add_other_additions_model.dart';
import '/core/widgets/custom_list_tile_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_form_field.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';
import '/core/models/step_type.dart';
import '/core/constant/style.dart';

class AddOtherAdditionsDialog extends StatelessWidget {
  final ProjectDetails projectDetails;
  final StepType stepType;
  const AddOtherAdditionsDialog({
    super.key,
    required this.projectDetails,
    required this.stepType,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<OtherAdditionsCubit>();
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      title: const Text(
        "اضافة عنصر جديد",
        textAlign: TextAlign.center,
        style: AppStyle.kTextStyle20,
      ),
      contentPadding: const EdgeInsets.all(14),
      content: Container(
        constraints: const BoxConstraints(maxWidth: 360, maxHeight: 450),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    CustomFormField(
                      controller: cubit.otherAdditionsNumber,
                      label: "رقم الموضوع",
                      hintText: "ادخل رقم الموضوع",
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
                      controller: cubit.otherAdditionsSubject,
                      label: "وصف الموضوع",
                      hintText: "ادخل وصف الموضوع",
                      maxLines: null,
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
              BlocBuilder<OtherAdditionsCubit, OtherAdditionsState>(
                builder: (context, state) {
                  return CustomListTileValidator(
                    leading: const Icon(Icons.file_copy_outlined),
                    title: cubit.addOtherAdditionsFile == null
                        ? "ارفاق ملف"
                        : "تم ارفاق الملف",
                    onTap: () => cubit.pickOtherAdditionsFile(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      actionsPadding: EdgeInsets.zero,
      actions: [
        BlocConsumer<OtherAdditionsCubit, OtherAdditionsState>(
          listener: (context, state) {
            if (state is AddOtherAdditionsSuccess) {
              AppPages.back(context);
            }
          },
          builder: (context, state) {
            return Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 20),
                constraints: const BoxConstraints(maxWidth: 360),
                child: CustomButton(
                  isLoading: state is AddOtherAdditionsLoading,
                  text: 'اضافة',
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.addNewOtherAdditions(
                        newFormData: AddOtherAdditionsModel(
                          number: cubit.otherAdditionsNumber.text,
                          description: cubit.otherAdditionsSubject.text,
                          formFile: cubit.addOtherAdditionsFile,
                          projectId: projectDetails.id!,
                          stepType: stepType.stepType,
                          stepTypeId: stepType.stepTypeId,
                        ),
                      );
                    }
                  },
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
