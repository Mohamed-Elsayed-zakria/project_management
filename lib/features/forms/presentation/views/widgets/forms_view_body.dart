import '/features/show_projects/presentation/views/widgets/project_details_form_shape_list_tile.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import '/core/models/files_nav_data.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/models/step_type.dart';
import '/core/routes/app_pages.dart';
import 'forms_header.dart';

class FormsViewBody extends StatelessWidget {
  final ProjectDetails projectDetails;
  final StepType stepType;

  const FormsViewBody({
    super.key,
    required this.projectDetails,
    required this.stepType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const FormsHeader(),
          const SizedBox(height: 10),
          ProjectDetailsFormShapeListTile(
            projectDetails: projectDetails,
            title: "رقم النموذج",
            subtitle: "اسم النموذج",
            guidanceLetterOnTap: () {},
            outgoingIncomingLettersOnTap: () => AppPages.to(
              data: FilesNavData(
                projectDetails: projectDetails,
                stepType: stepType,
              ),
              path: AppRoutes.incomingOutgoingLetters,
              context: context,
            ),
          ),
          const Divider(),
          ProjectDetailsFormShapeListTile(
            projectDetails: projectDetails,
            title: "رقم النموذج",
            subtitle: "اسم النموذج",
            guidanceLetterOnTap: () {},
            outgoingIncomingLettersOnTap: () => AppPages.to(
              data: FilesNavData(
                projectDetails: projectDetails,
                stepType: stepType,
              ),
              path: AppRoutes.incomingOutgoingLetters,
              context: context,
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
