import '/features/boq/presentation/manager/add_boq_item_cubit/add_boq_item_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/boq/presentation/manager/fetch_boq_cubit/fetch_boq_cubit.dart';
import '/features/boq/presentation/manager/add_boq_cubit/add_boq_cubit.dart';
import '/features/boq/data/repository/boq_implement.dart';
import 'widgets/boq_custom_accordion_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import 'widgets/boq_header.dart';

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
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Card(
          elevation: 3,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      BoqHeader(
                        projectDetails: projectDetails,
                      ),
                      const Divider(
                        thickness: 2,
                        color: AppColors.kPrimaryColor,
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                BoqCustomAccordionList(projectDetails: projectDetails),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
