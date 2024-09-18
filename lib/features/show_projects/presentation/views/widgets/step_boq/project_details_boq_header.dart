import '/features/show_projects/presentation/views/widgets/project_details_add_ons_letters.dart';
import '/features/show_projects/presentation/views/incoming_outgoing_letters_view.dart';
import 'project_details_create_new_boq_button.dart';
import 'package:flutter/material.dart';
import '/core/utils/size_screen.dart';

class ProjectDetailsBoqHeader extends StatelessWidget {
  const ProjectDetailsBoqHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = SizeScreen.size(context: context);
    return size.width > 730
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const ProjectDetailsCreateNewBoqButton(),
              ProjectDetailsAddOnsLetters(
                otherAdditionsOnTap: () {},
                formsOnTap: () {},
                lettersOnTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IncomingOutgoingLettersView(),
                  ),
                ),
              ),
            ],
          )
        : Column(
            children: [
              ProjectDetailsAddOnsLetters(
                otherAdditionsOnTap: () {},
                formsOnTap: () {},
                lettersOnTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IncomingOutgoingLettersView(),
                  ),
                ),
              ),
              const Divider(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProjectDetailsCreateNewBoqButton(),
                ],
              ),
            ],
          );
  }
}
