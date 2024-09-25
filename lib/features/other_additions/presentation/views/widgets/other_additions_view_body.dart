import '/features/show_projects/presentation/views/widgets/project_details_form_shape_list_tile.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'package:flutter/material.dart';
import 'other_additions_header.dart';

class OtherAdditionsViewBody extends StatelessWidget {
  final ProjectDetails projectDetails;

  const OtherAdditionsViewBody({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const OtherAdditionsHeader(),
          const SizedBox(height: 10),
          ProjectDetailsFormShapeListTile(
            projectDetails: projectDetails,
            title: "رقم النموذج",
            subtitle: "اسم النموذج",
            guidanceLetterOnTap: () {},
            outgoingIncomingLettersOnTap: () {},
          ),
          const Divider(),
          ProjectDetailsFormShapeListTile(
            projectDetails: projectDetails,
            title: "رقم النموذج",
            subtitle: "اسم النموذج",
            guidanceLetterOnTap: () {},
            outgoingIncomingLettersOnTap: () {},
          ),
          const Divider(),
        ],
      ),
    );
  }
}
