import '/features/show_projects/presentation/views/widgets/project_details_add_ons_letters.dart';
import 'kick_of_metting_add_forms_button.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/colors.dart';

class KickOfMettingHeader extends StatelessWidget {
  const KickOfMettingHeader({super.key});

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
                path: AppRoutes.otherAdditions,
                context: context,
              ),
              lettersOnTap: () => AppPages.to(
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
