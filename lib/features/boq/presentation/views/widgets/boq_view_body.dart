import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/boq/presentation/manager/add_boq_cubit/add_boq_cubit.dart';
import '/features/boq/presentation/manager/add_boq_cubit/add_boq_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'boq_custom_accordion_list.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import 'boq_header.dart';

class BoqViewBody extends StatelessWidget {
  final ProjectDetails projectDetails;

  const BoqViewBody({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Card(
        elevation: 3,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<AddBoqCubit, AddBoqState>(
            builder: (context, state) {
              return CustomScrollView(
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
              );
            },
          ),
        ),
      ),
    );
  }
}
