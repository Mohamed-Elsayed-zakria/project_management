import '/features/show_projects/presentation/views/widgets/project_details_add_ons_letters.dart';
import 'project_details_create_new_boq_button.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/utils/size_screen.dart';
import '/core/routes/app_pages.dart';

class ProjectDetailsBoqHeader extends StatelessWidget {
  const ProjectDetailsBoqHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = SizeScreen.size(context: context);
    return size.width > 730
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ProjectDetailsCreateNewBoqButton(),
              ProjectDetailsAddOnsLetters(
                otherAdditionsOnTap: () => AppPages.to(
                  path: AppRoutes.otherAdditions,
                  context: context,
                ),
                formsOnTap: () => AppPages.to(
                  path: AppRoutes.forms,
                  context: context,
                ),
                lettersOnTap: () => AppPages.to(
                  path: AppRoutes.incomingOutgoingLetters,
                  context: context,
                ),
              ),
            ],
          )
        : Column(
            children: [
              ProjectDetailsAddOnsLetters(
                otherAdditionsOnTap: () => AppPages.to(
                  path: AppRoutes.otherAdditions,
                  context: context,
                ),
                formsOnTap: () => AppPages.to(
                  path: AppRoutes.forms,
                  context: context,
                ),
                lettersOnTap: () => AppPages.to(
                  path: AppRoutes.incomingOutgoingLetters,
                  context: context,
                ),
              ),
              const Divider(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProjectDetailsCreateNewBoqButton(),
                ],
              ),
            ],
          );
  }
}
