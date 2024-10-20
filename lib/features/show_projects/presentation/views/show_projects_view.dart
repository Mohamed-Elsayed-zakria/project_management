import '/features/show_projects/presentation/manager/fetch_projects_cubit/fetch_projects_cubit.dart';
import '/features/show_projects/data/repository/fetch_projects_implement.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/show_projects_view_body.dart';
import 'package:flutter/material.dart';

class ShowProjectsView extends StatelessWidget {
  const ShowProjectsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchProjectsCubit(
        FetchProjectsImplement(),
      )..fetchAllProjects(),
      child: const ShowProjectsViewBody(),
    );
  }
}
