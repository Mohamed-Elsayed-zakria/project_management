import '/features/letters/presentation/manager/outgoing_letter_cubit/outgoing_letter_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/letters/presentation/manager/letters_cubit/letters_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_new_outgoing_letter_dialog.dart';
import 'package:flutter/material.dart';
import '/core/models/step_type.dart';
import 'outgoing_letters_search.dart';
import 'outgoing_letters_table.dart';
import 'add_new_letter_button.dart';

class OutgoingLettersContent extends StatelessWidget {
  final ProjectDetails projectDetails;
  final StepType stepType;

  const OutgoingLettersContent({
    super.key,
    required this.projectDetails,
    required this.stepType,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const OutgoingLettersSearch(),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              children: [
                AddNewLetterButton(
                  onTap: () {
                    OutgoingLetterCubit outgoingLetterCubit =
                        BlocProvider.of<OutgoingLetterCubit>(context);
                    LettersCubit letterCubit =
                        BlocProvider.of<LettersCubit>(context);
                    showDialog(
                      context: context,
                      builder: (context) => MultiBlocProvider(
                        providers: [
                          BlocProvider.value(
                            value: outgoingLetterCubit,
                          ),
                          BlocProvider.value(
                            value: letterCubit,
                          ),
                        ],
                        child: AddNewOutgoingLetterDialog(
                          projectDetails: projectDetails,
                          stepType: stepType,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 14),
            const OutgoingLettersTable(),
          ],
        ),
      ),
    );
  }
}
