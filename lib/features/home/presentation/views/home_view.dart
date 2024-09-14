import 'package:flutter/material.dart';
import 'widgets/large_view_body.dart';
import '/core/constant/colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: LargeViewBody(),
    );
  }
}
