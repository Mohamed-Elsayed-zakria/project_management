import '/features/letters/presentation/manager/incoming_letter_cubit/incoming_letter_cubit.dart';
import '/features/letters/presentation/manager/incoming_letter_cubit/incoming_letter_state.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/letters/presentation/manager/letters_cubit/letters_cubit.dart';
import '/features/letters/data/models/enum/letter_type_sender.dart';
import '/features/letters/data/models/enum/letter_type.dart';
import '/features/letters/data/models/add_letter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';
import '/core/utils/show_toast.dart';

class AddNewIncomingLetterDialogButton extends StatelessWidget {
  final ProjectDetails projectDetails;

  const AddNewIncomingLetterDialogButton({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    IncomingLetterCubit cubit = BlocProvider.of<IncomingLetterCubit>(context);
    LettersCubit letterCubit = BlocProvider.of<LettersCubit>(context);
    return BlocConsumer<IncomingLetterCubit, IncomingLetterState>(
      listener: (context, state) {
        if (state is IncomingLetterSuccess) {
          cubit.letterNumber.clear();
          cubit.letterSubject.clear();
          cubit.letterReplyNumber.clear();
          cubit.addLetterFile = null;
          cubit.newLetterDate = null;
          cubit.selectedLitterType = LetterType.newletter;
          AppPages.back(context);
        }
        if (state is IncomingLetterFailure) {
          ShowToast.show(
            context: context,
            msg: state.errMessage,
          );
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
              cubit.addNewLetter(
                incomingLetters: letterCubit.incomingLetters,
                outgoingLetters: letterCubit.outgoingLetters,
                newLetterDate: AddLetter(
                  projectId: projectDetails.id!,
                  date: cubit.newLetterDate.toString(),
                  number: cubit.letterNumber.text,
                  subject: cubit.letterSubject.text,
                  letterType: LetterTypeSender.incoming.name,
                  type: cubit.selectedLitterType.name,
                  replyTo: cubit.letterReplyNumber.text,
                  letterFile: cubit.addLetterFile!,
                ),
              );
            }
          },
        );
      },
    );
  }
}
