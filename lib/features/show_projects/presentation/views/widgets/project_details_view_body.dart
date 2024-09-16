import 'step_boq/project_details_primary_table_boq.dart';
import 'site_receipt/project_details_site_receipt.dart';
import '/core/widgets/accordion_item.dart';
import 'package:flutter/material.dart';

class ProjectDetailsViewBody extends StatelessWidget {
  const ProjectDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AccordionItem(
              title: "BOQ",
              content: ProjectDetailsPrimaryTableBoq(),
            ),
            AccordionItem(
              title: "استلام الموقع",
              content: ProjectDetailsSiteReceipt(),
            ),
          ],
        ),
      ),
    );
  }
}
