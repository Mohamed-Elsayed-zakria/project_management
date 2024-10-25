import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/forms/data/models/form_data/form_data.dart';
import '/core/widgets/form_shape_list_tile.dart';
import '/core/widgets/empty_placeholder.dart';
import '/core/models/files_nav_data.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/models/step_type.dart';
import '/core/routes/app_pages.dart';

class FormsViewItems extends StatelessWidget {
  final ProjectDetails projectDetails;
  final List<FormData> formDataList;
  final StepType stepType;
  const FormsViewItems({
    super.key,
    required this.projectDetails,
    required this.stepType,
    required this.formDataList,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: formDataList.isNotEmpty
          ? ListView.builder(
              itemCount: formDataList.length,
              itemBuilder: (context, index) {
                FormData formData = formDataList[index];
                return FormShapeListTile(
                  projectDetails: projectDetails,
                  title: formData.formNumber ?? "--",
                  subtitle: formData.formDescription ?? "--",
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
          : const EmptyPlaceholder(message: "لا يوجد نماذج"),
    );
  }
}
