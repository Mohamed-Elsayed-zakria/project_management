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
                icon: Icon(IconlyBroken.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconlyBroken.notification),
                label: 'Notice',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconlyBroken.video),
                label: 'Videos',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconlyBroken.category),
                label: 'Services',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconlyBroken.setting),
                label: 'Settings',
              ),
            ],
          ),
          body: IndexedStack(
            index: cubit.indexScreen,
            children: const [
              Center(
                child: Text('Notice Screen'),
              ),
              Center(
                child: Text('Video Screen'),
              ),
              Center(
                child: Text('Services Screen'),
              ),
              Center(
                child: Text('Settings Screen'),
              ),
              Center(
                child: Text('Test Screen'),
              ),
            ],
          ),
        );
      },
    );
  }
}
