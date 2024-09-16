import '/features/show_projects/presentation/views/show_projects_view.dart';
import '/features/new_project/presentation/views/new_project_view.dart';
import '/features/home/presentation/manager/home_cubit/home_cubit.dart';
import '/features/home/presentation/manager/home_cubit/home_state.dart';
import '/features/statistics/presentation/views/statistics_view.dart';
import '/features/settings/presentation/views/setting_view.dart';
import '/features/profile/presentation/views/profile_view.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';

class SmallViewBody extends StatelessWidget {
  const SmallViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColors.kSurfaceColor,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.kPrimaryColor,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            currentIndex: cubit.indexScreen,
            onTap: (value) {
              cubit.changeIndexScreen(value);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(IconlyBroken.chart),
                label: 'احصائيات',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconlyBroken.document),
                label: 'كل المشاريع',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconlyBroken.arrowUpSquare),
                label: 'مشروع جديد',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconlyBroken.profile),
                label: 'الملف الشخصي',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconlyBroken.setting),
                label: 'الاعدادات',
              ),
            ],
          ),
          body: IndexedStack(
            index: cubit.indexScreen,
            children: const [
              StatisticsView(),
              ShowProjectsView(),
              NewProjectView(),
              ProfileView(),
              SettingView(),
            ],
          ),
        );
      },
    );
  }
}
