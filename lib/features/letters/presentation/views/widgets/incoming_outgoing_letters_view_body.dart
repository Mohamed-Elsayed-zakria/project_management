import '../../manager/letters_cubit/letters_cubit.dart';
import '../../manager/letters_cubit/letters_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'incoming_outgoing_letters_header.dart';
import 'incoming_letters_content.dart';
import 'package:flutter/material.dart';
import 'outgoing_letters_content.dart';

class IncomingOutgoingLettersViewBody extends StatelessWidget {
  const IncomingOutgoingLettersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    LettersCubit cubit = BlocProvider.of<LettersCubit>(context);
    return BlocBuilder<LettersCubit, LettersState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const IncomingOutgoingLettersHeader(),
              const SizedBox(height: 10),
              const Divider(),
              cubit.incomingLettersIsActive
                  ? const IncomingLettersContent()
                  : cubit.outgoingLettersIsActive
                      ? const OutgoingLettersContent()
                      : const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
