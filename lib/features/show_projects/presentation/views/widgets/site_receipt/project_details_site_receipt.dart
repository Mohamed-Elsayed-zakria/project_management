import 'project_details_site_receipt_list_tile.dart';
import 'package:flutter/material.dart';

class ProjectDetailsSiteReceipt extends StatelessWidget {
  const ProjectDetailsSiteReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProjectDetailsSiteReceiptListTile(
          title: "PMF-007-INT-028",
          subtitle: "خطاب طلب تسمية المقاول لمندوبه لاستلام موقع المشروع",
          guidanceLetterOnTap: () {},
        ),
        const Divider(),
        ProjectDetailsSiteReceiptListTile(
          title: "PMF-007-INT-029",
          subtitle: "قرار إداري لتشكيل لجنة تسليم موقع مشروع",
          guidanceLetterOnTap: () {},
        ),
        const Divider(),
        ProjectDetailsSiteReceiptListTile(
          title: "PMF-007-INT-030",
          subtitle: "محضر تسليم موقع",
          guidanceLetterOnTap: () {},
        ),
        const Divider(),
        ProjectDetailsSiteReceiptListTile(
          title: "PMF-007-INT-031",
          subtitle: "محضر تأجيل تسليم موقع",
          guidanceLetterOnTap: () {},
        ),
        const Divider(),
        ProjectDetailsSiteReceiptListTile(
          title: "PMF-007-INT-032",
          subtitle: "إنذار بسبب عدم حضور المقاول لتسليم الموقع",
          guidanceLetterOnTap: () {},
        ),
      ],
    );
  }
}
