import 'widgets/statistics_projects_under_implement_chart.dart';
import 'widgets/statistics_projects_implement_chart.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class StatisticsView extends StatelessWidget {
  const StatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text(
              'احصائيات المشاريع',
              style: AppStyle.kTextStyle20,
            ),
            const SizedBox(height: 20),
            IntrinsicHeight(
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 600,
                ),
                child: const Row(
                  children: [
                    Expanded(
                      child: StatisticsProjectsUnderImplementChart(),
                    ),
                    VerticalDivider(
                      color: AppColors.kPrimaryColor,
                    ),
                    Expanded(
                      child: StatisticsProjectsImplementChart(),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
