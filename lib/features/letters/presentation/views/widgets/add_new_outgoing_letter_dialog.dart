import '/features/letters/presentation/manager/outgoing_letter_cubit/outgoing_letter_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'add_new_outgoing_letter_dialog_button.dart';
import 'add_new_outcoming_letter_take_file.dart';
import 'add_new_outcoming_letter_take_date.dart';
import '/core/widgets/custom_alert_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_form_field.dart';
import 'add_outcoming_letter_type.dart';
import 'package:flutter/material.dart';
import '/core/models/step_type.dart';

class AddNewOutgoingLetterDialog extends StatelessWidget {
  final ProjectDetails projectDetails;
  final StepType stepType;

  const AddNewOutgoingLetterDialog({
    super.key,
    required this.projectDetails,
    required this.stepType,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<OutgoingLetterCubit>();
    cubit.newLetterDateValidator = true;
    cubit.addLetterFileValidator = true;
    return CustomAlertDialog(
      title: "اضافة خطاب صادر",
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
            const AddNewOutcomingLetterTakeDate(),
            const AddNewOutcomingLetterTakeFile(),
            const SizedBox(height: 10),
            const AddOutcomingLetterType(),
            const SizedBox(height: 10),
            AddNewOutgoingLetterDialogButton(
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
