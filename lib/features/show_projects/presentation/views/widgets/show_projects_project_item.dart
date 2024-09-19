import '/core/widgets/custom_details_button.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/routes/app_pages.dart';

class ShowProjectsProjectItem extends StatelessWidget {
  const ShowProjectsProjectItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: const Text("اسم المشروع"),
                subtitle: const Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text("رقم المشروع"),
                ),
                onTap: () {
                  AppPages.to(
                    path: AppRoutes.projectDetails,
                    context: context,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomDetailsButton(
                onTap: () => AppPages.to(
                  path: AppRoutes.projectInfo,
                  context: context,
                ),
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
