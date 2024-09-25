import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/kick_of_metting/presentation/views/kick_of_metting_view.dart';
import '/features/site_receipt/presentation/views/site_receipt_view.dart';
import '/features/boq/presentation/views/boq_view.dart';
import 'widgets/project_details_large_view_menu.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

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
      BoqView(
        projectDetails: widget.projectDetails,
      ),
      SiteReceiptView(
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
            projectDetails: widget.projectDetails,
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
