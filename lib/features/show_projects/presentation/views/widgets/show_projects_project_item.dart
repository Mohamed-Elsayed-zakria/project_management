import '/core/widgets/custom_details_button.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

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
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("رقم المشروع"),
                      const SizedBox(height: 8),
                      CustomDetailsButton(
                        onTap: () => AppPages.to(
                          path: AppRoutes.projectInfo,
                          context: context,
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  AppPages.to(
                    path: AppRoutes.projectDetails,
                    context: context,
                  );
                },
              ),
            ),
            InkWell(
              onTap: () {
                AppPages.to(
                  path: AppRoutes.incomingOutgoingLetters,
                  context: context,
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "خطابات المشروع",
                  style: AppStyle.tabTextStyle.copyWith(
                    color: AppColors.kPrimaryColor,
                  ),
                  textAlign: TextAlign.start,
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
