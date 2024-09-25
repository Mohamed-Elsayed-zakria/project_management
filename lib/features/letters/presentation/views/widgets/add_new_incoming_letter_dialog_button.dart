import '/features/letters/presentation/manager/incoming_letter_cubit/incoming_letter_cubit.dart';
import '/features/letters/presentation/manager/incoming_letter_cubit/incoming_letter_state.dart';
import '/features/show_projects/data/models/enum/letter_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';

class AddNewIncomingLetterDialogButton extends StatelessWidget {
  const AddNewIncomingLetterDialogButton({super.key});

  @override
  Widget build(BuildContext context) {
    IncomingLetterCubit cubit = BlocProvider.of<IncomingLetterCubit>(context);
    return BlocConsumer<IncomingLetterCubit, IncomingLetterState>(
      listener: (context, state) {
        if (state is IncomingLetterSuccess) {
          AppPages.back(context);
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is IncomingLetterLoading,
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
