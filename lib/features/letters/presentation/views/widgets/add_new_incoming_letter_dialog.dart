import '/features/letters/presentation/views/widgets/add_new_incoming_letter_dialog_button.dart';
import '/features/letters/presentation/manager/incoming_letter_cubit/incoming_letter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_new_incoming_letter_take_file.dart';
import 'add_new_incoming_letter_take_date.dart';
import '/core/widgets/custom_form_field.dart';
import 'add_incoming_letter_type.dart';
import 'package:flutter/material.dart';
import '/core/constant/style.dart';

class AddNewIncomingLetterDialog extends StatelessWidget {
  const AddNewIncomingLetterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    IncomingLetterCubit cubit = BlocProvider.of<IncomingLetterCubit>(context);
    cubit.newLetterDateValidator = true;
    cubit.addLetterFileValidator = true;
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      title: const Text(
        "اضافة خطاب وارد",
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
              const AddNewIncomingLetterTakeDate(),
              const AddNewIncomingLetterTakeFile(),
              const SizedBox(height: 10),
              const AddIncomingLetterType(),
              const SizedBox(height: 10),
              const AddNewIncomingLetterDialogButton(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
