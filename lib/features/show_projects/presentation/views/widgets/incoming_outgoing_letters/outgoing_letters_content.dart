import '/features/show_projects/presentation/manager/letters_cubit/letters_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'incoming_outgoing_letters_search.dart';
import 'add_new_outgoing_letter_dialog.dart';
import 'package:flutter/material.dart';
import 'outgoing_letters_table.dart';
import 'add_new_letter_button.dart';

class OutgoingLettersContent extends StatelessWidget {
  const OutgoingLettersContent({super.key});

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
                    child: const AddNewOutgoingLetterDialog(),
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
