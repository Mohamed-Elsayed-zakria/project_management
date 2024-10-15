import '/features/show_projects/presentation/views/widgets/project_details_add_ons_letters.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'follow_timeline_setting_button.dart';
import '/core/models/enums/step_type.dart';
import '/core/models/files_nav_data.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/models/step_type.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/colors.dart';

class FollowTimelineHeader extends StatelessWidget {
  final ProjectDetails projectDetails;

  const FollowTimelineHeader({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const FollowTimelineSettingButton(),
            ProjectDetailsAddOnsLetters(
              mainAxisAlignment: MainAxisAlignment.end,
              otherAdditionsOnTap: () => AppPages.to(
                data: FilesNavData(
                  projectDetails: projectDetails,
                  stepType: StepType(
                    stepType: StepTypeName.followTimeline.name,
                  ),
                ),
                path: AppRoutes.otherAdditions,
                context: context,
              ),
              lettersOnTap: () => AppPages.to(
                data: FilesNavData(
                  projectDetails: projectDetails,
                  stepType: StepType(
                    stepType: StepTypeName.followTimeline.name,
                  ),
                ),
                path: AppRoutes.incomingOutgoingLetters,
                context: context,
              ),
              formsOnTap: () => AppPages.to(
                data: FilesNavData(
                  projectDetails: projectDetails,
                  stepType: StepType(
                    stepType: StepTypeName.followTimeline.name,
                  ),
                ),
                path: AppRoutes.forms,
                context: context,
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 2,
          color: AppColors.kPrimaryColor,
        )
      ],
    );
  }
}
