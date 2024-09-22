import '../../manager/incoming_letter_cubit/incoming_letter_cubit.dart';
import '../../manager/letters_cubit/letters_cubit.dart';
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
                LettersCubit lettersCubit =
                    BlocProvider.of<LettersCubit>(context);
                IncomingLetterCubit incomingLetterCubit =
                    BlocProvider.of<IncomingLetterCubit>(context);
                showDialog(
                  context: context,
                  builder: (context) => MultiBlocProvider(
                    providers: [
                      BlocProvider.value(
                        value: lettersCubit,
                      ),
                      BlocProvider.value(
                        value: incomingLetterCubit,
                      ),
                    ],
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
