import '/features/show_projects/presentation/views/incoming_outgoing_letters_view.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class ProjectDetailsSiteReceiptListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function() guidanceLetterOnTap;
  // final Function() outgoingIncomingLettersOnTap;
  const ProjectDetailsSiteReceiptListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.guidanceLetterOnTap,
    // required this.outgoingIncomingLettersOnTap,
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const IncomingOutgoingLettersView(),
                  ),
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
            "خطاب ارشادي",
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
