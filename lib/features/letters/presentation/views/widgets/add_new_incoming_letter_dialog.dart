import '/features/letters/presentation/views/widgets/add_new_incoming_letter_dialog_button.dart';
import '/features/letters/presentation/manager/incoming_letter_cubit/incoming_letter_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import '/core/widgets/custom_alert_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_new_incoming_letter_take_file.dart';
import 'add_new_incoming_letter_take_date.dart';
import '/core/widgets/custom_form_field.dart';
import 'add_incoming_letter_type.dart';
import 'package:flutter/material.dart';
import '/core/models/step_type.dart';

class AddNewIncomingLetterDialog extends StatelessWidget {
  final ProjectDetails projectDetails;
  final StepType stepType;

  const AddNewIncomingLetterDialog({
    super.key,
    required this.projectDetails,
    required this.stepType,
  });

  @override
  Widget build(BuildContext context) {
    IncomingLetterCubit cubit = BlocProvider.of<IncomingLetterCubit>(context);
    cubit.newLetterDateValidator = true;
    cubit.addLetterFileValidator = true;
    return CustomAlertDialog(
      title:  "اضافة خطاب وارد",
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Form(
              key: cubit.formKeyLetter,
              child: Column(
                children: [
                  CustomFormField(
                    controller: cubit.letterNumber,
                    label: "الرقم",
                    hintText: "ادخل الرقم",
                    prefixIcon: const Icon(Icons.numbers_outlined),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "مطلوب";
                      } else {
                        return null;
                      }
                    },
                  ),
                  CustomFormField(
                    controller: cubit.letterSubject,
                    label: "الموضوع",
                    hintText: "ادخل الموضوع",
                    prefixIcon: const Icon(Icons.subject_outlined),
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
            const AddNewIncomingLetterTakeDate(),
            const AddNewIncomingLetterTakeFile(),
            const SizedBox(height: 10),
            const AddIncomingLetterType(),
            const SizedBox(height: 10),
            AddNewIncomingLetterDialogButton(
              projectDetails: projectDetails,
              stepType: stepType,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
