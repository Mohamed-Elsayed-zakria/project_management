import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class ProjectDetailsFormShapeListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function() guidanceLetterOnTap;
  final Function() outgoingIncomingLettersOnTap;
  const ProjectDetailsFormShapeListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.guidanceLetterOnTap,
    required this.outgoingIncomingLettersOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
      ),
      subtitle: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            subtitle,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: InkWell(
              onTap: () {
                AppPages.to(
                  path: AppRoutes.incomingOutgoingLetters,
                  context: context,
                );
              },
              child: Text(
                "عرض الخطابات الصادرة والواردة",
                style: AppStyle.tabTextStyle.copyWith(
                  color: AppColors.kPrimaryColor,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          )
        ],
      ),
      trailing: InkWell(
        onTap: guidanceLetterOnTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "النموذج",
            style: AppStyle.tabTextStyle.copyWith(
              color: AppColors.kPrimaryColor,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ),
    );
  }
}
