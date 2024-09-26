import '/features/show_projects/presentation/views/widgets/project_details_form_shape_list_tile.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import '/core/models/enums/step_type.dart';
import '/core/models/files_nav_data.dart';
import 'widgets/site_receipt_header.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/models/step_type.dart';
import '/core/routes/app_pages.dart';

class SiteReceiptView extends StatelessWidget {
  final ProjectDetails projectDetails;

  const SiteReceiptView({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Card(
        elevation: 3,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProjectDetailsSiteReceiptHeader(
                  projectDetails: projectDetails,
                ),
                const SizedBox(height: 10),
                ProjectDetailsFormShapeListTile(
                  projectDetails: projectDetails,
                  title: "PMF-007-INT-028",
                  subtitle:
                      "خطاب طلب تسمية المقاول لمندوبه لاستلام موقع المشروع",
                  formFile: "",
                  outgoingIncomingLettersOnTap: () => AppPages.to(
                    data: FilesNavData(
                      projectDetails: projectDetails,
                      stepType: StepType(
                        stepType: StepTypeName.siteReceipt.name,
                      ),
                    ),
                    path: AppRoutes.incomingOutgoingLetters,
                    context: context,
                  ),
                ),
                const Divider(),
                ProjectDetailsFormShapeListTile(
                  projectDetails: projectDetails,
                  title: "PMF-007-INT-029",
                  subtitle: "قرار إداري لتشكيل لجنة تسليم موقع مشروع",
                  formFile: "",
                  outgoingIncomingLettersOnTap: () => AppPages.to(
                    data: FilesNavData(
                      projectDetails: projectDetails,
                      stepType: StepType(
                        stepType: StepTypeName.siteReceipt.name,
                      ),
                    ),
                    path: AppRoutes.incomingOutgoingLetters,
                    context: context,
                  ),
                ),
                const Divider(),
                ProjectDetailsFormShapeListTile(
                  projectDetails: projectDetails,
                  title: "PMF-007-INT-030",
                  subtitle: "محضر تسليم موقع",
                  formFile: "",
                  outgoingIncomingLettersOnTap: () => AppPages.to(
                    data: FilesNavData(
                      projectDetails: projectDetails,
                      stepType: StepType(
                        stepType: StepTypeName.siteReceipt.name,
                      ),
                    ),
                    path: AppRoutes.incomingOutgoingLetters,
                    context: context,
                  ),
                ),
                const Divider(),
                ProjectDetailsFormShapeListTile(
                  projectDetails: projectDetails,
                  title: "PMF-007-INT-031",
                  subtitle: "محضر تأجيل تسليم موقع",
                  formFile: "",
                  outgoingIncomingLettersOnTap: () => AppPages.to(
                    data: FilesNavData(
                      projectDetails: projectDetails,
                      stepType: StepType(
                        stepType: StepTypeName.siteReceipt.name,
                      ),
                    ),
                    path: AppRoutes.incomingOutgoingLetters,
                    context: context,
                  ),
                ),
                const Divider(),
                ProjectDetailsFormShapeListTile(
                  projectDetails: projectDetails,
                  title: "PMF-007-INT-032",
                  subtitle: "إنذار بسبب عدم حضور المقاول لتسليم الموقع",
                  formFile: "",
                  outgoingIncomingLettersOnTap: () => AppPages.to(
                    data: FilesNavData(
                      projectDetails: projectDetails,
                      stepType: StepType(
                        stepType: StepTypeName.siteReceipt.name,
                      ),
                    ),
                    path: AppRoutes.incomingOutgoingLetters,
                    context: context,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
