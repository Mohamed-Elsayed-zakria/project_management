import '/features/letters/presentation/manager/incoming_letter_cubit/incoming_letter_cubit.dart';
import '/features/letters/presentation/manager/outgoing_letter_cubit/outgoing_letter_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/letters/presentation/manager/letters_cubit/letters_cubit.dart';
import '/features/letters/data/repository/letters_implement.dart';
import 'widgets/incoming_outgoing_letters_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class IncomingOutgoingLettersView extends StatefulWidget {
  final ProjectDetails projectDetails;

  const IncomingOutgoingLettersView({
    super.key,
    required this.projectDetails,
  });

  @override
  State<IncomingOutgoingLettersView> createState() =>
      _IncomingOutgoingLettersViewState();
}

class _IncomingOutgoingLettersViewState
    extends State<IncomingOutgoingLettersView> {
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
            create: (context) => LettersCubit(LettersImplement()),
          ),
          BlocProvider(
            create: (context) => OutgoingLetterCubit(LettersImplement()),
          ),
          BlocProvider(
            create: (context) => IncomingLetterCubit(LettersImplement()),
          ),
        ],
        child: IncomingOutgoingLettersViewBody(
          projectDetails: widget.projectDetails,
        ),
      ),
    );
  }
}
