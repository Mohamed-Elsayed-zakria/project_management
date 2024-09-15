import '/features/home/presentation/manager/home_cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/adaptive_layout.dart';
import 'package:flutter/material.dart';
import 'widgets/large_view_body.dart';
import 'widgets/small_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: AdaptiveLayout(
        largeView: (context) => const LargeViewBody(),
        smallView: (context) => const SmallViewBody(),
      ),
    );
  }
}
