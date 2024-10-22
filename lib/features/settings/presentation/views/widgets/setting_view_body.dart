import '/features/settings/presentation/manager/setting_projects_cubit/setting_projects_cubit.dart';
import '/features/settings/presentation/manager/setting_projects_cubit/setting_projects_state.dart';
import '/features/settings/presentation/manager/setting_cubit/setting_cubit.dart';
import '/features/settings/presentation/manager/setting_cubit/setting_state.dart';
import 'projects_setting/setting_projects_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/utils/show_toast.dart';
import 'setting_company_info.dart';
import 'setting_header.dart';

class SettingViewBody extends StatelessWidget {
  const SettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
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
                BlocListener<SettingProjectsCubit, SettingProjectsState>(
                  listener: (context, state) {
                    if (state is UpdateSettingProjectsSuccess) {
                      ShowToast.show(
                        context: context,
                        msg: "تم التحديث",
                        success: true,
                      );
                    }
                  },
                  child: Expanded(
                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        scrollbars: false,
                      ),
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
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
