import '/features/show_projects/data/models/project_details/project_details.dart';
import 'other_additions_add_addition_button.dart';
import 'package:flutter/material.dart';
import '/core/models/step_type.dart';
import '/core/constant/colors.dart';

class OtherAdditionsHeader extends StatelessWidget {
  final ProjectDetails projectDetails;
  final StepType stepType;
  const OtherAdditionsHeader({
    super.key,
    required this.projectDetails,
    required this.stepType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OtherAdditionsAddAdditionButton(
          projectDetails: projectDetails,
          stepType: stepType,
        ),
        const Divider(
          color: AppColors.kPrimaryColor,
        ),
      ],
    );
  }
}
