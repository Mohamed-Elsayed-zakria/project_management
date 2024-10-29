import '/features/statistics/presentation/manager/statistics_cubit/statistics_cubit.dart';
import '/features/statistics/data/repository/statistics_implement.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/statistics_view_body.dart';
import 'package:flutter/material.dart';

class StatisticsView extends StatelessWidget {
  const StatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StatisticsCubit(StatisticsImplement()),
      child: const StatisticsViewBody(),
    );
  }
}
