import '/features/show_projects/presentation/views/widgets/site_receipt/project_details_site_receipt_header.dart';
import 'widgets/project_details_form_shape_list_tile.dart';
import 'package:flutter/material.dart';

class ProjectDetailsSiteReceiptView extends StatelessWidget {
  const ProjectDetailsSiteReceiptView({super.key});

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
                const ProjectDetailsSiteReceiptHeader(),
                const SizedBox(height: 10),
                ProjectDetailsFormShapeListTile(
                  title: "PMF-007-INT-028",
                  subtitle:
                      "خطاب طلب تسمية المقاول لمندوبه لاستلام موقع المشروع",
                  guidanceLetterOnTap: () {},
                  outgoingIncomingLettersOnTap: () {},
                ),
                const Divider(),
                ProjectDetailsFormShapeListTile(
                  title: "PMF-007-INT-029",
                  subtitle: "قرار إداري لتشكيل لجنة تسليم موقع مشروع",
                  guidanceLetterOnTap: () {},
                  outgoingIncomingLettersOnTap: () {},
                ),
                const Divider(),
                ProjectDetailsFormShapeListTile(
                  title: "PMF-007-INT-030",
                  subtitle: "محضر تسليم موقع",
                  guidanceLetterOnTap: () {},
                  outgoingIncomingLettersOnTap: () {},
                ),
                const Divider(),
                ProjectDetailsFormShapeListTile(
                  title: "PMF-007-INT-031",
                  subtitle: "محضر تأجيل تسليم موقع",
                  guidanceLetterOnTap: () {},
                  outgoingIncomingLettersOnTap: () {},
                ),
                const Divider(),
                ProjectDetailsFormShapeListTile(
                  title: "PMF-007-INT-032",
                  subtitle: "إنذار بسبب عدم حضور المقاول لتسليم الموقع",
                  guidanceLetterOnTap: () {},
                  outgoingIncomingLettersOnTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
