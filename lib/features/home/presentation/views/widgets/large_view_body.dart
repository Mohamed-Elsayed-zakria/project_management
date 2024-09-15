import '/features/home/presentation/manager/home_cubit/home_cubit.dart';
import '/features/home/presentation/manager/home_cubit/home_state.dart';
import '/features/new_project/presentation/views/new_project_view.dart';
import '/features/settings/presentation/views/setting_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import 'large_view_menu.dart';

class LargeViewBody extends StatelessWidget {
  const LargeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = BlocProvider.of<HomeCubit>(context);
    final List<Widget> screens = [
      const Card(
        color: Colors.white,
        elevation: 3,
        child: Text('احصائيات'),
      ),
      const NewProjectView(),
      const Card(
        color: Colors.white,
        elevation: 3,
        child: Text('كل المشاريع'),
      ),
      const Card(
        color: Colors.white,
        elevation: 3,
        child: Text('الملف الشخصي'),
      ),
      const SettingView(),
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
