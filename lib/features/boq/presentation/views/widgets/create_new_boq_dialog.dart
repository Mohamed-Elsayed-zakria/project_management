import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/boq/presentation/manager/fetch_boq_cubit/fetch_boq_cubit.dart';
import '/features/boq/presentation/manager/add_boq_cubit/add_boq_cubit.dart';
import '/features/boq/presentation/manager/add_boq_cubit/add_boq_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_alert_dialog.dart';
import '/core/widgets/custom_form_field.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/utils/show_toast.dart';
import '/core/routes/app_pages.dart';

class CreateNewBoqDialog extends StatelessWidget {
  final ProjectDetails projectDetails;

  const CreateNewBoqDialog({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    var addBoqCubit = context.read<AddBoqCubit>();
    var fetchBoqCubit = context.read<FetchBoqCubit>();
    return CustomAlertDialog(
      title: "اضافة جدول معدل جديد",
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 10),
          Form(
            key: addBoqCubit.formKeyBoq,
            child: CustomFormField(
              controller: addBoqCubit.addNewBoqController,
              label: "اسم الجدول المعدل",
              hintText: "ادخل اسم الجدول",
              prefixIcon: const Icon(Icons.table_rows_outlined),
            ),
          ),
          const SizedBox(height: 10),
          BlocConsumer<AddBoqCubit, AddBoqState>(
            listener: (context, state) {
              if (state is AddBoqSuccess) {
                addBoqCubit.addNewBoqController.clear();
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
                  if (addBoqCubit.formKeyBoq.currentState!.validate()) {
                    addBoqCubit.addNewBoq(
                      name: addBoqCubit.addNewBoqController.text,
                      projectId: projectDetails.id!,
                      boqData: fetchBoqCubit.boqData,
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
