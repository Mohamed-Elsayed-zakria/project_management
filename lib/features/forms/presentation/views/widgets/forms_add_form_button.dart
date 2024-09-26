import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/forms/presentation/manager/forms_cubit/forms_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/models/step_type.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';
import 'add_form_dialog.dart';

class FormsAddFormButton extends StatelessWidget {
  final ProjectDetails projectDetails;
  final StepType stepType;
  const FormsAddFormButton({
    super.key,
    required this.projectDetails,
    required this.stepType,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FormsCubit cubit = BlocProvider.of<FormsCubit>(context);
        showDialog(
          context: context,
          builder: (_) => BlocProvider.value(
            value: cubit,
            child: AddFormDialog(
              projectDetails: projectDetails,
              stepType: stepType,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "اضافة نموذج جديد",
          style: AppStyle.tabTextStyle.copyWith(
            color: AppColors.kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
