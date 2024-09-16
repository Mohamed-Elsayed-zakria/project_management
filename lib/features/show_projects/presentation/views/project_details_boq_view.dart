import 'widgets/step_boq/project_details_modified_table_one_boq.dart';
import 'widgets/step_boq/project_details_modified_table_two_boq.dart';
import 'widgets/step_boq/project_details_primary_table_boq.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class ProjectDetailsBoqView extends StatelessWidget {
  const ProjectDetailsBoqView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Card(
        elevation: 3,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProjectDetailsPrimaryTableBoq(),
                SizedBox(height: 20),
                Divider(
                  thickness: 2,
                  color: AppColors.kPrimaryColor,
                ),
                ProjectDetailsModifiedTableOneBoq(),
                SizedBox(height: 20),
                Divider(
                  thickness: 2,
                  color: AppColors.kPrimaryColor,
                ),
                ProjectDetailsModifiedTableTwoBoq(),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
