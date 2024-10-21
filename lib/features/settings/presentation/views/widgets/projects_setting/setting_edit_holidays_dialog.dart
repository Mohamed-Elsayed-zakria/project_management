import '/features/settings/presentation/manager/setting_projects_cubit/setting_projects_state.dart';
import '/features/settings/presentation/manager/setting_projects_cubit/setting_projects_cubit.dart';
import '/features/settings/data/models/add_project_settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/style.dart';

class SettingEditHolidaysDialog extends StatefulWidget {
  const SettingEditHolidaysDialog({super.key});

  @override
  State<SettingEditHolidaysDialog> createState() =>
      _SettingEditHolidaysDialogState();
}

class _SettingEditHolidaysDialogState extends State<SettingEditHolidaysDialog> {
  late SettingProjectsCubit cubit;

  @override
  void initState() {
    cubit = context.read<SettingProjectsCubit>();
    if (cubit.projectSettings.holidays != null) {
      for (var day in cubit.projectSettings.holidays!) {
        if (cubit.selectedDays.containsKey(day)) {
          cubit.selectedDays[day] = true;
        }
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingProjectsCubit, SettingProjectsState>(
      listener: (context, state) {
        if (state is UpdateSettingProjectsSuccess) {
          AppPages.back(context);
        }
      },
      child: AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        title: const Text(
          "تعديل الاجازات",
          textAlign: TextAlign.center,
          style: AppStyle.kTextStyle20,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        content: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...cubit.daysOfWeek.entries.map((entry) {
                final englishDay = entry.key;
                final arabicDay = entry.value;

                return SwitchListTile(
                  title: Text(arabicDay),
                  value: cubit.selectedDays[englishDay]!,
                  onChanged: (bool value) {
                    setState(() {
                      cubit.selectedDays[englishDay] = value;
                    });
                  },
                );
              }),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Collect the selected days into a list
              List<String> selectedDaysList = cubit.selectedDays.entries
                  .where((entry) => entry.value)
                  .map((entry) => entry.key)
                  .toList();
              cubit.updateProjectSettings(
                projectSettingsData: AddProjectSettings(
                  holidays: selectedDaysList,
                ),
              );
            },
            child: const Text("حفظ"),
          ),
          TextButton(
            onPressed: () {
              AppPages.back(context);
            },
            child: const Text("إلغاء"),
          ),
        ],
      ),
    );
  }
}
