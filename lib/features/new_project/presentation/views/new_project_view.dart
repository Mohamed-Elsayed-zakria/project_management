import '/features/new_project/presentation/manager/new_project_cubit/new_project_cubit.dart';
import '/features/new_project/data/repository/new_project_implement.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/new_project_view_body.dart';
import 'package:flutter/material.dart';

class NewProjectView extends StatelessWidget {
  const NewProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewProjectCubit(NewProjectImplement()),
      child: const NewProjectViewBody(),
    );
  }
}
