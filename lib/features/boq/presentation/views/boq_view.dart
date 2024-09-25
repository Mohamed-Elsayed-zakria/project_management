import '/features/boq/presentation/manager/add_boq_item_cubit/add_boq_item_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/boq/presentation/manager/fetch_boq_cubit/fetch_boq_cubit.dart';
import '/features/boq/presentation/manager/add_boq_cubit/add_boq_cubit.dart';
import '/features/boq/data/repository/boq_implement.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'widgets/boq_view_body.dart';

class BoqView extends StatelessWidget {
  final ProjectDetails projectDetails;

  const BoqView({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchBoqCubit(BoqImplement()),
        ),
        BlocProvider(
          create: (context) => AddBoqCubit(BoqImplement()),
        ),
        BlocProvider(
          create: (context) => AddBoqItemCubit(BoqImplement()),
        ),
      ],
      child: BoqViewBody(projectDetails: projectDetails),
    );
  }
}
