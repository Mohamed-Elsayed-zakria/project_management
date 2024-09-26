import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/forms/presentation/manager/add_form_cubit/add_form_cubit.dart';
import '/features/forms/presentation/manager/forms_cubit/forms_cubit.dart';
import '/features/forms/data/repository/forms_implement.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'widgets/forms_view_body.dart';
import '/core/models/step_type.dart';

class FormsView extends StatelessWidget {
  final ProjectDetails projectDetails;
  final StepType stepType;

  const FormsView({
    super.key,
    required this.projectDetails,
    required this.stepType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("النماذج"),
        centerTitle: true,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => FormsCubit(FormsImplement()),
          ),
          BlocProvider(
            create: (context) => AddFormCubit(FormsImplement()),
          ),
        ],
        child: FormsViewBody(
          projectDetails: projectDetails,
          stepType: stepType,
        ),
      ),
    );
  }
}
