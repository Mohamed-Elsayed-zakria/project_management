import '/features/show_projects/presentation/views/widgets/project_details_add_ons_letters.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'kick_of_metting_add_forms_button.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/colors.dart';

class KickOfMettingHeader extends StatelessWidget {
  final ProjectDetails projectDetails;

  const KickOfMettingHeader({
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
            const KickOfMettingAddFormsButton(),
            ProjectDetailsAddOnsLetters(
              mainAxisAlignment: MainAxisAlignment.end,
              otherAdditionsOnTap: () => AppPages.to(
                data: projectDetails,
                path: AppRoutes.otherAdditions,
                context: context,
              ),
              lettersOnTap: () => AppPages.to(
                data: projectDetails,
                path: AppRoutes.incomingOutgoingLetters,
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
