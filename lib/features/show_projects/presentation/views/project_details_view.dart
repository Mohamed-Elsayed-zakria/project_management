import 'widgets/project_details_large_view_menu.dart';
import 'project_details_site_receipt_view.dart';
import 'package:flutter/material.dart';
import 'project_details_boq_view.dart';
import '/core/constant/colors.dart';

class ProjectDetailsView extends StatefulWidget {
  const ProjectDetailsView({super.key});

  @override
  State<ProjectDetailsView> createState() => _ProjectDetailsViewState();
}

class _ProjectDetailsViewState extends State<ProjectDetailsView> {
  int indexScreen = 0;
  final List<Widget> screens = [
    const ProjectDetailsBoqView(),
    const ProjectDetailsSiteReceiptView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: AppBar(
        title: const Text("تفاصيل المشروع"),
        centerTitle: true,
      ),
      body: Row(
        children: [
          ProjectDetailsLargeViewMenu(
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
