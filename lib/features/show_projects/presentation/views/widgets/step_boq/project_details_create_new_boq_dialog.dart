import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/show_projects/presentation/manager/boq_cubit/boq_state.dart';
import '/features/show_projects/presentation/manager/boq_cubit/boq_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_form_field.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/utils/show_toast.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/style.dart';

class ProjectDetailsCreateNewBoqDialog extends StatelessWidget {
  final ProjectDetails projectDetails;

  const ProjectDetailsCreateNewBoqDialog({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    BoqCubit cubit = BlocProvider.of<BoqCubit>(context);
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      title: const Text(
        "اضافة جدول معدل جديد",
        textAlign: TextAlign.center,
        style: AppStyle.kTextStyle20,
      ),
      contentPadding: const EdgeInsets.all(14),
      content: Container(
        constraints: const BoxConstraints(maxWidth: 360),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Form(
              key: cubit.formKeyBoq,
              child: CustomFormField(
                controller: cubit.addNewBoqController,
                label: "اسم الجدول المعدل",
                hintText: "ادخل اسم الجدول",
                prefixIcon: const Icon(Icons.table_rows_outlined),
              ),
            ),
            const SizedBox(height: 10),
            BlocConsumer<BoqCubit, BoqState>(
              listener: (context, state) {
                if (state is AddBoqSuccess) {
                  AppPages.back(context);
                }
                if (state is AddBoqFailure) {
                  ShowToast.show(
                    context: context,
                    msg: state.errMessage,
                  );
                }
              },
              builder: (context, state) {
                return CustomButton(
                  isLoading: state is AddBoqLoading,
                  text: 'اضافة',
                  onPressed: () {
                    if (cubit.formKeyBoq.currentState!.validate()) {
                      cubit.addNewBoq(
                        name: cubit.addNewBoqController.text,
                        projectId: projectDetails.id!,
                      );
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
