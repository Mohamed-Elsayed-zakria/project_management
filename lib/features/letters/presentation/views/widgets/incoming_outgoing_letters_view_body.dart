import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/letters/presentation/manager/letters_cubit/letters_cubit.dart';
import '/features/letters/presentation/manager/letters_cubit/letters_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'incoming_outgoing_letters_header.dart';
import '/core/widgets/loading_widget.dart';
import 'incoming_letters_content.dart';
import 'package:flutter/material.dart';
import 'outgoing_letters_content.dart';

class IncomingOutgoingLettersViewBody extends StatefulWidget {
  final ProjectDetails projectDetails;
  const IncomingOutgoingLettersViewBody({
    super.key,
    required this.projectDetails,
  });

  @override
  State<IncomingOutgoingLettersViewBody> createState() =>
      _IncomingOutgoingLettersViewBodyState();
}

class _IncomingOutgoingLettersViewBodyState
    extends State<IncomingOutgoingLettersViewBody> {
  late LettersCubit cubit;
  @override
  void initState() {
    cubit = BlocProvider.of<LettersCubit>(context);
    cubit.getAllLetter(projectId: widget.projectDetails.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LettersCubit, LettersState>(
      builder: (context, state) {
        if (state is LetterSuccess) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const IncomingOutgoingLettersHeader(),
                const SizedBox(height: 10),
                const Divider(),
                cubit.incomingLettersIsActive
                    ? IncomingLettersContent(
                        projectDetails: widget.projectDetails,
                      )
                    : cubit.outgoingLettersIsActive
                        ? OutgoingLettersContent(
                            projectDetails: widget.projectDetails,
                          )
                        : const SizedBox(),
              ],
            ),
          );
        } else if (state is LetterFailure) {
          return Text(state.errMessage);
        }
        return const Center(
          child: LoadingWidget(),
        );
      },
    );
  }
}
