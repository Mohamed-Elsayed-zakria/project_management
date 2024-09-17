import '/features/show_projects/presentation/manager/letters_cubit/letters_cubit.dart';
import '/features/show_projects/presentation/manager/letters_cubit/letters_state.dart';
import '/features/show_projects/data/models/enum/letter_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class AddNewLetterTypeLetter extends StatelessWidget {
  const AddNewLetterTypeLetter({super.key});

  @override
  Widget build(BuildContext context) {
    LettersCubit cubit = BlocProvider.of<LettersCubit>(context);
    return BlocBuilder<LettersCubit, LettersState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Text("نوع الخطاب"),
                ),
                Row(
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
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            Visibility(
              visible: cubit.selectedLitterType == LetterType.replyToLetter,
              child: CustomFormField(
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
          ],
        );
      },
    );
  }
}
