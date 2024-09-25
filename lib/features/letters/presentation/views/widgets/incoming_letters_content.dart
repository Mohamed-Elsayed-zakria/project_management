import '/features/letters/presentation/manager/incoming_letter_cubit/incoming_letter_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/letters/presentation/manager/letters_cubit/letters_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'incoming_outgoing_letters_search.dart';
import 'add_new_incoming_letter_dialog.dart';
import 'package:flutter/material.dart';
import 'incoming_letters_table.dart';
import 'add_new_letter_button.dart';

class IncomingLettersContent extends StatelessWidget {
  final ProjectDetails projectDetails;

  const IncomingLettersContent({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const IncomingOutgoingLettersSearch(),
        const Divider(),
        const SizedBox(height: 10),
        Row(
          children: [
            AddNewLetterButton(
              onTap: () {
                IncomingLetterCubit incomingLetterCubit =
                    BlocProvider.of<IncomingLetterCubit>(context);
                LettersCubit letterCubit =
                    BlocProvider.of<LettersCubit>(context);
                showDialog(
                  context: context,
                  builder: (context) => MultiBlocProvider(
                    providers: [
                      BlocProvider.value(
                        value: incomingLetterCubit,
                      ),
                      BlocProvider.value(
                        value: letterCubit,
                      ),
                    ],
                    child: AddNewIncomingLetterDialog(
                      projectDetails: projectDetails,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 14),
        const IncomingLettersTable(),
      ],
    );
  }
}
