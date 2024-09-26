import 'package:project_management/core/models/enums/step_type.dart';
import 'package:project_management/core/models/files_nav_data.dart';
import 'package:project_management/core/models/step_type.dart';
import 'package:project_management/core/routes/app_pages.dart';
import 'package:project_management/core/routes/app_routes.dart';

import '/features/show_projects/presentation/views/widgets/project_details_form_shape_list_tile.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'widgets/kick_of_metting_header.dart';
import 'package:flutter/material.dart';

class KickOfMettingView extends StatelessWidget {
  final ProjectDetails projectDetails;

  const KickOfMettingView({
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
                KickOfMettingHeader(
                  projectDetails: projectDetails,
                ),
                const SizedBox(height: 10),
                ProjectDetailsFormShapeListTile(
                  projectDetails: projectDetails,
                  title: "PMF-007-INT-033",
                  subtitle: "Kick of Meeting Agenda",
                  formFile: "",
                  outgoingIncomingLettersOnTap: () => AppPages.to(
                    data: FilesNavData(
                      projectDetails: projectDetails,
                      stepType: StepType(
                        stepType: StepTypeName.kickOfMetting.name,
                      ),
                    ),
                    path: AppRoutes.incomingOutgoingLetters,
                    context: context,
                  ),
                ),
                const Divider(),
                ProjectDetailsFormShapeListTile(
                  projectDetails: projectDetails,
                  title: "PMF-007-INT-034",
                  subtitle: "Kick-off Meeting Minutes",
                  formFile: "",
                  outgoingIncomingLettersOnTap: () {},
                ),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
