import '/features/show_projects/presentation/views/show_projects_view.dart';
import '/features/new_project/presentation/views/new_project_view.dart';
import '/features/statistics/presentation/views/statistics_view.dart';
import '/features/settings/presentation/views/setting_view.dart';
import '/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import 'large_view_menu.dart';

class LargeViewBody extends StatefulWidget {
  const LargeViewBody({super.key});

  @override
  State<LargeViewBody> createState() => _LargeViewBodyState();
}

class _LargeViewBodyState extends State<LargeViewBody> {
  int indexScreen = 0;
  List<Widget> screens = const [
    StatisticsView(),
    ShowProjectsView(),
    NewProjectView(),
    ProfileView(),
    SettingView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: Row(
        children: [
          LargeViewMenu(
            currentIndex: indexScreen,
            onTap: (value) => {
              indexScreen = value,
              setState(() {}),
            },
          ),
          Expanded(
            child: Center(
              child: screens[indexScreen],
            ),
          ),
        ],
      ),
    );
  }
}
