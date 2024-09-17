import '/features/show_projects/presentation/manager/incoming_letter_cubit/incoming_letter_cubit.dart';
import '/features/show_projects/presentation/manager/outgoing_letter_cubit/outgoing_letter_cubit.dart';
import '/features/show_projects/presentation/manager/letters_cubit/letters_cubit.dart';
import 'widgets/incoming_outgoing_letters/incoming_outgoing_letters_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class IncomingOutgoingLettersView extends StatelessWidget {
  const IncomingOutgoingLettersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الخطابات الصادرة والواردة"),
        centerTitle: true,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => LettersCubit(),
          ),
          BlocProvider(
            create: (context) => OutgoingLetterCubit(),
          ),
          BlocProvider(
            create: (context) => IncomingLetterCubit(),
          ),
        ],
        child: const IncomingOutgoingLettersViewBody(),
      ),
    );
  }
}
