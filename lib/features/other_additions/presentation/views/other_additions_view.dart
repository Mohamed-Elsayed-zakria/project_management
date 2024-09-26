import '/features/other_additions/presentation/manager/other_additions_cubit/other_additions_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/other_additions/data/repository/other_additions_implement.dart';
import 'widgets/other_additions_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/models/step_type.dart';

class OtherAdditionsView extends StatelessWidget {
  final ProjectDetails projectDetails;
  final StepType stepType;

  const OtherAdditionsView({
    super.key,
    required this.projectDetails,
    required this.stepType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('اضافات اخرى'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => OtherAdditionsCubit(
          OtherAdditionsImplement(),
        ),
        child: OtherAdditionsViewBody(
          projectDetails: projectDetails,
          stepType: stepType,
        ),
      ),
    );
  }
}
