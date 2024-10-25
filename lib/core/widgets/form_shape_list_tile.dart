import '/features/show_projects/data/models/project_details/project_details.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '/core/constant/api_end_point.dart';
import '/core/utils/url_open_file.dart';
import 'package:flutter/material.dart';
import '/core/utils/size_screen.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class FormShapeListTile extends StatelessWidget {
  final ProjectDetails projectDetails;
  final String title;
  final String subtitle;
  final String? formFile;
  final Function() outgoingIncomingLettersOnTap;

  const FormShapeListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.outgoingIncomingLettersOnTap,
    required this.projectDetails,
    required this.formFile,
  });

  @override
  Widget build(BuildContext context) {
    Size size = SizeScreen.size(context: context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        color: Colors.white,
        elevation: 2.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            color: AppColors.kPrimaryColor,
            width: 1,
          ),
        ),
        child: ListTile(
          title: AutoSizeText(
            title,
          ),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 4),
                constraints: BoxConstraints(maxWidth: size.width * 0.5),
                child: AutoSizeText(
                  subtitle,
                  style: AppStyle.tabTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: InkWell(
                  onTap: outgoingIncomingLettersOnTap,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "عرض الخطابات الصادرة والواردة",
                      style: AppStyle.tabTextStyle.copyWith(
                        color: AppColors.kPrimaryColor,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              )
            ],
          ),
          trailing: Visibility(
            visible: formFile != null,
            child: InkWell(
              onTap: () async {
                await UrlOpenFile.openFile(
                  "${APIEndPoint.mediaBaseUrl}$formFile",
                );
              },
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
          ),
        ),
      ),
    );
  }
}
