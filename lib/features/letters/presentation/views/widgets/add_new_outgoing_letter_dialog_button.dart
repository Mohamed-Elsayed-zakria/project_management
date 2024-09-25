import '/features/letters/presentation/manager/outgoing_letter_cubit/outgoing_letter_cubit.dart';
import '/features/letters/presentation/manager/outgoing_letter_cubit/outgoing_letter_state.dart';
import '/features/show_projects/data/models/enum/letter_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';

class AddNewOutgoingLetterDialogButton extends StatelessWidget {
  const AddNewOutgoingLetterDialogButton({super.key});

  @override
  Widget build(BuildContext context) {
    OutgoingLetterCubit cubit = BlocProvider.of<OutgoingLetterCubit>(context);
    return BlocConsumer<OutgoingLetterCubit, OutgoingLetterState>(
      listener: (context, state) {
        if (state is OutgoingLetterSuccess) {
          AppPages.back(context);
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is OutgoingLetterLoading,
          text: 'اضافة',
          onPressed: () {
            cubit.validatorNewLetterDateField();
            cubit.validatorTakeLetterFileField();
            bool letterNumber = true;
            if (cubit.selectedLitterType != LetterType.newletter) {
              letterNumber = cubit.letterNumberFormKey.currentState!.validate();
            }
            if (cubit.formKeyLetter.currentState!.validate() &&
                cubit.newLetterDateValidator &&
                cubit.addLetterFileValidator &&
                letterNumber) {
              print("======add new letter");
            }
          },
        );
      },
    );
  }
}
