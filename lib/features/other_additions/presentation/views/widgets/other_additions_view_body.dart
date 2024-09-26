import '/features/show_projects/presentation/views/widgets/project_details_form_shape_list_tile.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import '/core/models/files_nav_data.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import 'other_additions_header.dart';
import '/core/models/step_type.dart';
import '/core/routes/app_pages.dart';

class OtherAdditionsViewBody extends StatelessWidget {
  final ProjectDetails projectDetails;
  final StepType stepType;
  const OtherAdditionsViewBody({
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
          OtherAdditionsHeader(
            projectDetails: projectDetails,
            stepType: stepType,
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              itemCount: 12,
              itemBuilder: (context, index) {
                return ProjectDetailsFormShapeListTile(
                  projectDetails: projectDetails,
                  title: "رقم النموذج",
                  subtitle: "اسم النموذج",
                  formFile: "",
                  outgoingIncomingLettersOnTap: () => AppPages.to(
                    data: FilesNavData(
                      projectDetails: projectDetails,
                      stepType: StepType(
                        stepType: stepType.stepType,
                        stepTypeId: "",
                      ),
                    ),
                    path: AppRoutes.incomingOutgoingLetters,
                    context: context,
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            ),
          ),
        ],
      ),
    );
  }
}
