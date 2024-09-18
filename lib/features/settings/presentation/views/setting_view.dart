import '/features/settings/presentation/manager/cubit/setting_state.dart';
import '/features/settings/presentation/manager/cubit/setting_cubit.dart';
import 'widgets/projects_setting/setting_projects_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/setting_company_info.dart';
import 'package:flutter/material.dart';
import 'widgets/setting_header.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingCubit(),
      child: Card(
        color: Colors.white,
        elevation: 3,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<SettingCubit, SettingState>(
            builder: (context, state) {
              SettingCubit cubit = BlocProvider.of<SettingCubit>(context);
              return Column(
                children: [
                  const SizedBox(height: 10),
                  const SettingHeader(),
                  const SizedBox(height: 10),
                  const Divider(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          cubit.projectSettingIsActive
                              ? const SettingProjectsInfo()
                              : cubit.companySettingIsActive
                                  ? const SettingCompanyInfo()
                                  : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
