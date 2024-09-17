import 'widgets/step_boq/project_details_create_new_boq_button.dart';
import 'widgets/step_boq/project_details_create_new_boq_table.dart';
import 'widgets/step_boq/project_details_primary_table_boq.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class ProjectDetailsBoqView extends StatelessWidget {
  const ProjectDetailsBoqView({super.key});

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
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: Column(
                  children: [
                    ProjectDetailsPrimaryTableBoq(),
                    SizedBox(height: 20),
                    Divider(
                      thickness: 2,
                      color: AppColors.kPrimaryColor,
                    ),
                  ],
                ),
              ),
              SliverList.separated(
                separatorBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Divider(
                    thickness: 2,
                    color: AppColors.kPrimaryColor,
                  ),
                ),
                itemCount: 1,
                itemBuilder: (context, index) {
                  return const ProjectDetailsCreateNewBoqTable();
                },
              ),
              const SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Divider(
                      thickness: 2,
                      color: AppColors.kPrimaryColor,
                    ),
                    ProjectDetailsCreateNewBoqButton(),
                    SizedBox(height: 20),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
