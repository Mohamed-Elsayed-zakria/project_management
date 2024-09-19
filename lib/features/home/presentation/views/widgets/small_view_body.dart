import '/features/home/presentation/manager/home_cubit/home_cubit.dart';
import '/features/home/presentation/manager/home_cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SmallViewBody extends StatelessWidget {
  const SmallViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return const Scaffold(
          body: Text("small view"),
        );
      },
    );
  }
}
