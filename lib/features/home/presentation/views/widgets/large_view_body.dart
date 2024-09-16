import '/features/show_projects/presentation/views/show_projects_view.dart';
import '/features/home/presentation/manager/home_cubit/home_cubit.dart';
import '/features/home/presentation/manager/home_cubit/home_state.dart';
import '/features/new_project/presentation/views/new_project_view.dart';
import '/features/statistics/presentation/views/statistics_view.dart';
import '/features/settings/presentation/views/setting_view.dart';
import '/features/profile/presentation/views/profile_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import 'large_view_menu.dart';

class LargeViewBody extends StatelessWidget {
  const LargeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = BlocProvider.of<HomeCubit>(context);
    const List<Widget> screens = [
      StatisticsView(),
      ShowProjectsView(),
      NewProjectView(),
      ProfileView(),
      SettingView(),
    ];
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.kBackgroundColor,
          body: Row(
            children: [
              LargeViewMenu(
                onTap: (value) => {
                  cubit.changeIndexScreen(value),
                },
              ),
              Expanded(
                child: Center(
                  child: screens[cubit.indexScreen],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
