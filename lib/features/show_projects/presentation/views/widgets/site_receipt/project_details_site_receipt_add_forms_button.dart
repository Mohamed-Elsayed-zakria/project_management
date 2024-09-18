import '/features/show_projects/presentation/views/widgets/project_details_add_forms_dialog.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class ProjectDetailsSiteReceiptAddFormsButton extends StatelessWidget {
  const ProjectDetailsSiteReceiptAddFormsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (context) => ProjectDetailsAddFormsDialog(
          onPressed: () {
            Navigator.pop(context);
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
