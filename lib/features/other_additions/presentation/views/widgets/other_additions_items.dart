import '/features/other_additions/data/models/other_additions_data/other_additions_data.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import '/core/widgets/form_shape_list_tile.dart';
import '/core/widgets/empty_placeholder.dart';
import '/core/models/files_nav_data.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/models/step_type.dart';
import '/core/routes/app_pages.dart';

class OtherAdditionsItems extends StatelessWidget {
  final List<OtherAdditionsData> otherAdditionsData;
  final ProjectDetails projectDetails;
  final StepType stepType;

  const OtherAdditionsItems({
    super.key,
    required this.otherAdditionsData,
    required this.projectDetails,
    required this.stepType,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: otherAdditionsData.isNotEmpty
          ? ListView.builder(
              itemCount: otherAdditionsData.length,
              itemBuilder: (context, index) {
                OtherAdditionsData formData = otherAdditionsData[index];
                return FormShapeListTile(
                  projectDetails: projectDetails,
                  title: formData.number ?? "--",
                  subtitle: formData.description ?? "--",
                  formFile: formData.formFile,
                  outgoingIncomingLettersOnTap: () => AppPages.to(
                    data: FilesNavData(
                      projectDetails: projectDetails,
                      stepType: StepType(
                        stepType: stepType.stepType,
                        stepTypeId: formData.id,
                      ),
                    ),
                    path: AppRoutes.incomingOutgoingLetters,
                    context: context,
                  ),
                );
              },
            )
          : const EmptyPlaceholder(message: "لا يوجد عناصر"),
    );
  }
}
