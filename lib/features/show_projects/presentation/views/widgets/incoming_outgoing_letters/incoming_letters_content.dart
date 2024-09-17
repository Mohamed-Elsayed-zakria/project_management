import '/features/show_projects/presentation/manager/letters_cubit/letters_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'incoming_outgoing_letters_search.dart';
import 'add_new_incoming_letter_dialog.dart';
import 'package:flutter/material.dart';
import 'incoming_letters_table.dart';
import 'add_new_letter_button.dart';

class IncomingLettersContent extends StatelessWidget {
  const IncomingLettersContent({super.key});

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
                LettersCubit cubit = BlocProvider.of<LettersCubit>(context);
                showDialog(
                  context: context,
                  builder: (context) => BlocProvider.value(
                    value: cubit,
                    child: const AddNewIncomingLetterDialog(),
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
