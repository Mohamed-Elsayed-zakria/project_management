import 'statistics_projects_under_implement_chart.dart';
import 'statistics_projects_implement_chart.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class StatisticsViewBody extends StatelessWidget {
  const StatisticsViewBody({super.key});

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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Material(
                shape: const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  side: BorderSide(color: AppColors.kPrimaryColor),
                ),
                color: Colors.white,
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "اجمالي عدد المشاريع",
                        style: AppStyle.tabTextStyle,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "24",
                        style: AppStyle.tabTextStyle.copyWith(
                          color: AppColors.kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
            ),
            const SizedBox(height: 8),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
