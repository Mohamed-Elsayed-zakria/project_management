import '/features/settings/presentation/views/widgets/edite_project_element/setting_edite_holidays.dart';
import '/features/settings/presentation/views/widgets/edite_project_element/setting_edite_tax.dart';
import '/features/settings/presentation/manager/setting_projects_cubit/setting_projects_cubit.dart';
import '/features/settings/presentation/manager/setting_projects_cubit/setting_projects_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'setting_projects_title.dart';
import '/core/constant/style.dart';

class SettingProjectsInfo extends StatelessWidget {
  const SettingProjectsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    const double maxWidth = 750;
    return BlocBuilder<SettingProjectsCubit, SettingProjectsState>(
      builder: (context, state) {
        if (state is SettingProjectsLoading) {
          return const Center(
            child: LoadingWidget(),
          );
        }
        if (state is SettingProjectsFailure) {
          return Center(
            child: Text(
              state.failure,
              style: AppStyle.tabTextStyle,
            ),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SettingProjectsTitle(),
            Container(
              constraints: const BoxConstraints(maxWidth: maxWidth),
              child: const Column(
                children: [
                  SettingEditeTax(),
                  Divider(),
                  SettingEditeHolidays(),
                  Divider(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
