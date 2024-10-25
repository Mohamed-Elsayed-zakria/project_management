import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/forms/presentation/manager/forms_cubit/forms_cubit.dart';
import '/features/forms/presentation/manager/forms_cubit/forms_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import '/core/models/step_type.dart';
import 'forms_view_items.dart';
import 'forms_header.dart';

class FormsViewBody extends StatelessWidget {
  final ProjectDetails projectDetails;
  final StepType stepType;

  const FormsViewBody({
    super.key,
    required this.projectDetails,
    required this.stepType,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<FormsCubit>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          FormsHeader(
            projectDetails: projectDetails,
            stepType: stepType,
          ),
          const SizedBox(height: 10),
          BlocBuilder<FormsCubit, FormsState>(
            builder: (context, state) {
              if (state is FormsLoading) {
                return const Expanded(
                  child: Center(
                    child: LoadingWidget(),
                  ),
                );
              }
              if (state is FormsFailure) {
                return Center(
                  child: Text(state.errMessage),
                );
              }
              return FormsViewItems(
                projectDetails: projectDetails,
                stepType: stepType,
                formDataList: cubit.formDataList,
              );
            },
          ),
        ],
      ),
    );
  }
}
