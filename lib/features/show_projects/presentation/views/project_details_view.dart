import '/features/show_projects/data/models/project_details/project_details.dart';
import 'widgets/project_details_large_view_menu.dart';
import 'project_details_site_receipt_view.dart';
import 'package:flutter/material.dart';
import 'project_details_boq_view.dart';
import '/core/constant/colors.dart';
import 'kick_of_metting_view.dart';

class ProjectDetailsView extends StatefulWidget {
  final ProjectDetails projectDetails;

  const ProjectDetailsView({
    super.key,
    required this.projectDetails,
  });

  @override
  State<ProjectDetailsView> createState() => _ProjectDetailsViewState();
}

class _ProjectDetailsViewState extends State<ProjectDetailsView> {
  int indexScreen = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      ProjectDetailsBoqView(
        projectDetails: widget.projectDetails,
      ),
      ProjectDetailsSiteReceiptView(
        projectDetails: widget.projectDetails,
      ),
      KickOfMettingView(
        projectDetails: widget.projectDetails,
      ),
    ];
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: AppBar(
        title: const Text("تفاصيل المشروع"),
        centerTitle: true,
      ),
      body: Row(
        children: [
          ProjectDetailsLargeViewMenu(
            currentIndex: indexScreen,
            onTap: (index) {
              indexScreen = index;
              setState(() {});
            },
          ),
          Expanded(
            child: Center(
              child: screens[indexScreen],
            ),
          ),
        ],
      ),
    );
  }
}
