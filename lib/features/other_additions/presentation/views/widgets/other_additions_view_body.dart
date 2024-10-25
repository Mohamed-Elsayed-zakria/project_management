import '/features/other_additions/presentation/manager/other_additions_cubit/other_additions_cubit.dart';
import '/features/other_additions/presentation/manager/other_additions_cubit/other_additions_state.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'other_additions_header.dart';
import '/core/models/step_type.dart';
import 'other_additions_items.dart';

class OtherAdditionsViewBody extends StatelessWidget {
  final ProjectDetails projectDetails;
  final StepType stepType;
  const OtherAdditionsViewBody({
    super.key,
    required this.projectDetails,
    required this.stepType,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<OtherAdditionsCubit>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          OtherAdditionsHeader(
            projectDetails: projectDetails,
            stepType: stepType,
          ),
          const SizedBox(height: 10),
          BlocBuilder<OtherAdditionsCubit, OtherAdditionsState>(
            builder: (context, state) {
              if (state is OtherAdditionsLoading) {
                return const Expanded(
                  child: Center(
                    child: LoadingWidget(),
                  ),
                );
              }
              if (state is OtherAdditionsFailure) {
                return Center(
                  child: Text(state.errMessage),
                );
              }
              return OtherAdditionsItems(
                projectDetails: projectDetails,
                otherAdditionsData: cubit.otherAdditionsData,
                stepType: stepType,
              );
            },
          ),
        ],
      ),
    );
  }
}
