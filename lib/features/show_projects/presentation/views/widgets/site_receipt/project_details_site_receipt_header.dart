import '/features/show_projects/presentation/views/widgets/project_details_add_ons_letters.dart';
import '/features/show_projects/presentation/views/incoming_outgoing_letters_view.dart';
import 'project_details_site_receipt_add_forms_button.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class ProjectDetailsSiteReceiptHeader extends StatelessWidget {
  const ProjectDetailsSiteReceiptHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const ProjectDetailsSiteReceiptAddFormsButton(),
            ProjectDetailsAddOnsLetters(
              mainAxisAlignment: MainAxisAlignment.end,
              otherAdditionsOnTap: () {},
              lettersOnTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const IncomingOutgoingLettersView(),
                ),
              ),
            ),
          ],
        ),
        const Divider(
          thickness: 2,
          color: AppColors.kPrimaryColor,
        )
      ],
    );
  }
}
