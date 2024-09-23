import '/features/show_projects/presentation/manager/project_info_cubit/project_info_cubit.dart';
import '/features/show_projects/presentation/manager/project_info_cubit/project_info_state.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'project_duration_per_day_item.dart';
import 'project_value_added_tax_item.dart';
import 'project_receipt_date_item.dart';
import 'package:flutter/material.dart';
import 'project_end_date_item.dart';
import 'project_manager_item.dart';
import 'project_file_po_item.dart';
import 'project_date_po_item.dart';
import 'project_number_item.dart';
import 'project_owner_item.dart';
import 'project_price_item.dart';
import 'project_area_item.dart';
import 'project_city_item.dart';
import 'project_name_item.dart';

class ProjectInfoViewBody extends StatelessWidget {
  final ProjectDetails projectDetails;

  const ProjectInfoViewBody({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(8),
                constraints: const BoxConstraints(
                  maxWidth: 700,
                ),
                child: BlocBuilder<ProjectInfoCubit, ProjectInfoState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        ProjectNameItem(
                          projectDetails: projectDetails,
                        ),
                        const Divider(),
                        ProjectNumberItem(
                          projectDetails: projectDetails,
                        ),
                        const Divider(),
                        ProjectPriceItem(
                          projectDetails: projectDetails,
                        ),
                        const Divider(),
                        ProjectManagerItem(
                          projectDetails: projectDetails,
                        ),
                        const Divider(),
                        ProjectOwnerItem(
                          projectDetails: projectDetails,
                        ),
                        const Divider(),
                        ProjectAreaItem(
                          projectDetails: projectDetails,
                        ),
                        const Divider(),
                        ProjectCityItem(
                          projectDetails: projectDetails,
                        ),
                        const Divider(),
                        ProjectValueAddedTaxItem(
                          projectDetails: projectDetails,
                        ),
                        const Divider(),
                        ProjectDurationPerDayItem(
                          projectDetails: projectDetails,
                        ),
                        const Divider(),
                        ProjectReceiptDateItem(
                          projectDetails: projectDetails,
                        ),
                        const Divider(),
                        ProjectEndDateItem(
                          projectDetails: projectDetails,
                        ),
                        const Divider(),
                        ProjectDatePoItem(
                          projectDetails: projectDetails,
                        ),
                        const Divider(),
                        ProjectFilePoItem(
                          projectDetails: projectDetails,
                        ),
                        const Divider(),
                        const SizedBox(height: 20),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
