import '/features/letters/presentation/manager/outgoing_letter_cubit/outgoing_letter_cubit.dart';
import 'add_new_outgoing_letter_dialog_button.dart';
import 'add_new_outcoming_letter_take_file.dart';
import 'add_new_outcoming_letter_take_date.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_form_field.dart';
import 'add_outcoming_letter_type.dart';
import 'package:flutter/material.dart';
import '/core/constant/style.dart';

class AddNewOutgoingLetterDialog extends StatelessWidget {
  const AddNewOutgoingLetterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    OutgoingLetterCubit cubit = BlocProvider.of<OutgoingLetterCubit>(context);
    cubit.newLetterDateValidator = true;
    cubit.addLetterFileValidator = true;
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      title: const Text(
        "اضافة خطاب صادر",
        textAlign: TextAlign.center,
        style: AppStyle.kTextStyle20,
      ),
      contentPadding: const EdgeInsets.all(14),
      content: Container(
        constraints: const BoxConstraints(maxWidth: 360),
        child: SingleChildScrollView(
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
              const AddNewOutgoingLetterDialogButton(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
