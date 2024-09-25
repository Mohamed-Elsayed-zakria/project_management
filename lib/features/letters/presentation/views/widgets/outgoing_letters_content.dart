import '/features/letters/presentation/manager/outgoing_letter_cubit/outgoing_letter_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'incoming_outgoing_letters_search.dart';
import 'add_new_outgoing_letter_dialog.dart';
import 'package:flutter/material.dart';
import 'outgoing_letters_table.dart';
import 'add_new_letter_button.dart';

class OutgoingLettersContent extends StatelessWidget {
  final ProjectDetails projectDetails;

  const OutgoingLettersContent({
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
                OutgoingLetterCubit outgoingLetterCubit =
                    BlocProvider.of<OutgoingLetterCubit>(context);
                showDialog(
                  context: context,
                  builder: (context) => BlocProvider.value(
                    value: outgoingLetterCubit,
                    child: AddNewOutgoingLetterDialog(
                      projectDetails: projectDetails,
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
    );
  }
}
