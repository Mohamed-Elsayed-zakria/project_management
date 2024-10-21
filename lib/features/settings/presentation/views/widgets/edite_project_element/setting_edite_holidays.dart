import '/features/settings/presentation/views/widgets/projects_setting/setting_edit_holidays_dialog.dart';
import '/features/settings/presentation/manager/setting_projects_cubit/setting_projects_cubit.dart';
import '/features/settings/presentation/manager/setting_projects_cubit/setting_projects_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/utils/show_toast.dart';

class SettingEditeHolidays extends StatelessWidget {
  const SettingEditeHolidays({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SettingProjectsCubit>();

    return BlocConsumer<SettingProjectsCubit, SettingProjectsState>(
      listener: (context, state) {
        if (state is UpdateSettingProjectsFailure) {
          ShowToast.show(
            context: context,
            msg: state.message,
          );
        }
      },
      builder: (context, state) {
        return ListTile(
          title: const Text("الاجازات الرسمية"),
          subtitle: Text(
            cubit.projectSettings.holidays != null &&
                    cubit.projectSettings.holidays!.isNotEmpty
                ? cubit.projectSettings.holidays!.join(", ")
                : "--",
          ),
          trailing: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => BlocProvider.value(
                  value: cubit,
                  child: const SettingEditHolidaysDialog(),
                ),
              );
            },
            icon: const Icon(
              Icons.edit_outlined,
              color: Colors.green,
            ),
          ),
        );
      },
    );
  }
}
