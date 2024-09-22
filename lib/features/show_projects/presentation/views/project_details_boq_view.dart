import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/show_projects/presentation/manager/boq_cubit/boq_cubit.dart';
import '/features/show_projects/data/repository/boq_implement.dart';
import 'widgets/step_boq/project_details_boq_header.dart';
import 'widgets/step_boq/boq_custom_accordion_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class ProjectDetailsBoqView extends StatelessWidget {
  final ProjectDetails projectDetails;

  const ProjectDetailsBoqView({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BoqCubit(BoqImplement()),
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
                      ProjectDetailsBoqHeader(
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
