import '/core/widgets/custom_circular_percent.dart';
import '/core/widgets/custom_details_button.dart';
import '/core/widgets/form_divider.dart';
import 'package:flutter/material.dart';
import '/core/constant/style.dart';

class StatisticsProjectsImplementChart extends StatelessWidget {
  const StatisticsProjectsImplementChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "تم التنفيذ",
                style: AppStyle.kTextStyle18,
              ),
              SizedBox(height: 2),
              FormDivider(
                width: 90,
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        const CustomCircularPercent(
          percent: .5,
          progressColor: Colors.green,
        ),
        const SizedBox(height: 10),
        const Text(
          "12",
          style: AppStyle.kTextStyle18,
        ),
        const SizedBox(height: 4),
        CustomDetailsButton(
          onTap: () {},
        ),
      ],
    );
  }
}
