import '/features/show_projects/presentation/views/widgets/project_details_add_ons_letters.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import '/core/models/enums/step_type.dart';
import '/core/models/files_nav_data.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/utils/size_screen.dart';
import '/core/models/step_type.dart';
import '/core/routes/app_pages.dart';
import 'create_new_boq_button.dart';

class BoqHeader extends StatelessWidget {
  final ProjectDetails projectDetails;

  const BoqHeader({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = SizeScreen.size(context: context);
    return size.width > 730
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CreateNewBoqButton(
                projectDetails: projectDetails,
              ),
              ProjectDetailsAddOnsLetters(
                otherAdditionsOnTap: () => AppPages.to(
                  data: FilesNavData(
                    projectDetails: projectDetails,
                    stepType: StepType(
                      stepType: StepTypeName.boq.name,
                    ),
                  ),
                  path: AppRoutes.otherAdditions,
                  context: context,
                ),
                formsOnTap: () => AppPages.to(
                  data: FilesNavData(
                    projectDetails: projectDetails,
                    stepType: StepType(
                      stepType: StepTypeName.boq.name,
                    ),
                  ),
                  path: AppRoutes.forms,
                  context: context,
                ),
                lettersOnTap: () => AppPages.to(
                  data: FilesNavData(
                    projectDetails: projectDetails,
                    stepType: StepType(
                      stepType: StepTypeName.boq.name,
                    ),
                  ),
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
                  data: FilesNavData(
                    projectDetails: projectDetails,
                    stepType: StepType(
                      stepType: StepTypeName.boq.name,
                    ),
                  ),
                  path: AppRoutes.otherAdditions,
                  context: context,
                ),
                formsOnTap: () => AppPages.to(
                  data: FilesNavData(
                    projectDetails: projectDetails,
                    stepType: StepType(
                      stepType: StepTypeName.boq.name,
                    ),
                  ),
                  path: AppRoutes.forms,
                  context: context,
                ),
                lettersOnTap: () => AppPages.to(
                  data: FilesNavData(
                    projectDetails: projectDetails,
                    stepType: StepType(
                      stepType: StepTypeName.boq.name,
                    ),
                  ),
                  path: AppRoutes.incomingOutgoingLetters,
                  context: context,
                ),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CreateNewBoqButton(
                    projectDetails: projectDetails,
                  ),
                ],
              ),
            ],
          );
  }
}
