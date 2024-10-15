import '/features/show_projects/data/models/project_details/project_details.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '/core/models/files_nav_data.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/routes/app_pages.dart';
import '/core/models/step_type.dart';

class ProjectDetailsLargeViewMenu extends StatelessWidget {
  final ProjectDetails projectDetails;
  final Function(int) onTap;
  final int currentIndex;

  const ProjectDetailsLargeViewMenu({
    super.key,
    required this.onTap,
    required this.currentIndex,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    int indexScreen = 0;
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.all(8),
        width: 215,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    title: const Text('دورة المشروع'),
                    leading: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_outlined),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    selected: currentIndex == 0,
                    selectedTileColor: Colors.grey[300],
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    title: const Center(
                      child: Text(
                        'BOQ',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onTap: () {
                      indexScreen = 0;
                      onTap(indexScreen);
                    },
                  ),
                  ListTile(
                    selected: currentIndex == 1,
                    selectedTileColor: Colors.grey[300],
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    title: const Center(
                      child: Text(
                        'استلام الموقع',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onTap: () {
                      indexScreen = 1;
                      onTap(indexScreen);
                    },
                  ),
                  ListTile(
                    selected: currentIndex == 2,
                    selectedTileColor: Colors.grey[300],
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    title: const Center(
                      child: Text(
                        'KICK OF MEETING',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onTap: () {
                      indexScreen = 2;
                      onTap(indexScreen);
                    },
                  ),
                  ListTile(
                    selected: currentIndex == 3,
                    selectedTileColor: Colors.grey[300],
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    title: const Center(
                      child: Text(
                        'مرفقات الجدول الزمني',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onTap: () {
                      indexScreen = 3;
                      onTap(indexScreen);
                    },
                  ),
                  ListTile(
                    selected: currentIndex == 4,
                    selectedTileColor: Colors.grey[300],
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    title: const Center(
                      child: Text(
                        'متابعة الجدول الزمني',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onTap: () {
                      indexScreen = 4;
                      onTap(indexScreen);
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              onTap: () => AppPages.to(
                data: FilesNavData(
                  projectDetails: projectDetails,
                  stepType: StepType(),
                ),
                path: AppRoutes.incomingOutgoingLetters,
                context: context,
              ),
              title: const Text("الصادر و الوارد"),
              leading: const Icon(IconlyBroken.document),
            ),
          ],
        ),
      ),
    );
  }
}
