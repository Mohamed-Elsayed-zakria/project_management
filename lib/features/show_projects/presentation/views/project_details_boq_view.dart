import 'widgets/step_boq/project_details_create_new_boq_table.dart';
import 'widgets/step_boq/project_details_primary_table_boq.dart';
import '/core/widgets/accordion/custom_accordion_list.dart';
import 'widgets/step_boq/project_details_boq_header.dart';
import '/core/widgets/accordion/accordion_items.dart';
import '/core/widgets/accordion/accordion_type.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class ProjectDetailsBoqView extends StatelessWidget {
  const ProjectDetailsBoqView({super.key});

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
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: Column(
                  children: [
                    ProjectDetailsBoqHeader(),
                    Divider(
                      thickness: 2,
                      color: AppColors.kPrimaryColor,
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              CustomAccordionList(
                accordionType: AccordionType.sliverList,
                children: [
                  AccordionItems(
                    title: "الجدول الأساسي",
                    content: const ProjectDetailsPrimaryTableBoq(),
                  ),
                  AccordionItems(
                    title: "الجدول المعدل واحد",
                    content: const ProjectDetailsCreateNewBoqTable(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
