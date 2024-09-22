import '/features/show_projects/presentation/views/widgets/project_details_form_shape_list_tile.dart';
import 'package:flutter/material.dart';
import 'forms_header.dart';

class FormsViewBody extends StatelessWidget {
  const FormsViewBody({super.key});

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
          ),
          const Divider(),
          ProjectDetailsFormShapeListTile(
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
