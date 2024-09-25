import '/features/letters/presentation/manager/incoming_letter_cubit/incoming_letter_state.dart';
import '/features/letters/presentation/manager/incoming_letter_cubit/incoming_letter_cubit.dart';
import '/features/show_projects/data/models/enum/letter_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class AddIncomingLetterType extends StatelessWidget {
  const AddIncomingLetterType({super.key});

  @override
  Widget build(BuildContext context) {
    IncomingLetterCubit cubit = BlocProvider.of<IncomingLetterCubit>(context);
    return BlocBuilder<IncomingLetterCubit, IncomingLetterState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(4, 0, 4, 18),
              child: Text(
                "نوع الخطاب",
                style: TextStyle(fontSize: 15),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Radio<LetterType>(
                      value: LetterType.newletter,
                      groupValue: cubit.selectedLitterType,
                      onChanged: (LetterType? value) {
                        if (value != null) {
                          cubit.changeSelectedLitterType(value);
                        }
                      },
                    ),
                    const Text("جديد"),
                  ],
                ),
                const SizedBox(width: 10),
                Row(
                  children: [
                    Radio<LetterType>(
                      value: LetterType.replyToLetter,
                      groupValue: cubit.selectedLitterType,
                      onChanged: (LetterType? value) {
                        if (value != null) {
                          cubit.changeSelectedLitterType(value);
                        }
                      },
                    ),
                    const Text("رد على خطاب"),
                  ],
                ),
                const SizedBox(width: 10),
                Row(
                  children: [
                    Radio<LetterType>(
                      value: LetterType.replyWithClosure,
                      groupValue: cubit.selectedLitterType,
                      onChanged: (LetterType? value) {
                        if (value != null) {
                          cubit.changeSelectedLitterType(value);
                        }
                      },
                    ),
                    const Text("رد مع الغلق"),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Visibility(
              visible: cubit.selectedLitterType != LetterType.newletter,
              child: Form(
                key: cubit.letterNumberFormKey,
                child: CustomFormField(
                  controller: cubit.letterReplyNumber,
                  label: "رقم الخطاب",
                  hintText: "ادخل رقم الخطاب",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "مطلوب";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
