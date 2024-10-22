import '/features/show_projects/presentation/manager/project_info_cubit/project_info_state.dart';
import '/features/show_projects/presentation/manager/project_info_cubit/project_info_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/style.dart';

class ProjectEditHolidaysDialog extends StatefulWidget {
  final ProjectDetails projectDetails;

  const ProjectEditHolidaysDialog({
    super.key,
    required this.projectDetails,
  });

  @override
  State<ProjectEditHolidaysDialog> createState() =>
      _ProjectEditHolidaysDialogState();
}

class _ProjectEditHolidaysDialogState extends State<ProjectEditHolidaysDialog> {
  late ProjectInfoCubit cubit;

  @override
  void initState() {
    cubit = context.read<ProjectInfoCubit>();
    if (widget.projectDetails.holidays != null) {
      for (var day in widget.projectDetails.holidays!) {
        if (cubit.selectedDays.containsKey(day)) {
          cubit.selectedDays[day] = true;
        }
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectInfoCubit, ProjectInfoState>(
      listener: (context, state) {
        if (state is UpdateProjectSuccess) {
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
              cubit.changeProjectHolidays(
                newHolidays: selectedDaysList,
                projectDetails: widget.projectDetails,
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
