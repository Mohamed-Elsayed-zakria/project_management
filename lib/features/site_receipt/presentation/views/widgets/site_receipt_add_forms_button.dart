import '/features/show_projects/presentation/views/widgets/project_details_add_forms_dialog.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class SiteReceiptAddFormsButton extends StatelessWidget {
  const SiteReceiptAddFormsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (context) => ProjectDetailsAddFormsDialog(
          onPressed: () {
            AppPages.back(context);
          },
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "اضافة نموذج",
          style: AppStyle.tabTextStyle.copyWith(
            color: AppColors.kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
