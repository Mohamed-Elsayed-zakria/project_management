import '/features/show_projects/presentation/views/widgets/project_details_form_shape_list_tile.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'package:flutter/material.dart';
import 'forms_header.dart';

class FormsViewBody extends StatelessWidget {
  final ProjectDetails projectDetails;
  const FormsViewBody({
    super.key,
    required this.projectDetails,
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
            title: "رقم النموذج",
            subtitle: "اسم النموذج",
            guidanceLetterOnTap: () {},
            outgoingIncomingLettersOnTap: () {},
            projectDetails: projectDetails,
          ),
          const Divider(),
          ProjectDetailsFormShapeListTile(
            title: "رقم النموذج",
            subtitle: "اسم النموذج",
            guidanceLetterOnTap: () {},
            outgoingIncomingLettersOnTap: () {},
            projectDetails: projectDetails,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
