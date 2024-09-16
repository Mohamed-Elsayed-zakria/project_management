import '/features/home/presentation/manager/home_cubit/home_cubit.dart';
import '/features/home/presentation/manager/home_cubit/home_state.dart';
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
                icon: Icon(IconlyBroken.arrowUpSquare),
                label: 'مشروع جديد',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconlyBroken.document),
                label: 'كل المشاريع',
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
              Center(
                child: Text('احصائيات'),
              ),
              Center(
                child: Text('مشروع جديد'),
              ),
              Center(
                child: Text('كل المشاريع'),
              ),
              Center(
                child: Text('الملف الشخصي'),
              ),
              Center(
                child: Text('الاعدادات'),
              ),
            ],
          ),
        );
      },
    );
  }
}
