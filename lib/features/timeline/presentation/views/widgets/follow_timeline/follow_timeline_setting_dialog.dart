import '/features/timeline/presentation/manager/follow_timeline_cubit/follow_timeline_cubit.dart';
import '/core/widgets/custom_switch_list_tile.dart';
import '/core/widgets/custom_alert_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class FollowTimelineSettingDialog extends StatelessWidget {
  const FollowTimelineSettingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<FollowTimelineCubit>();
    return CustomAlertDialog(
      title: "الاعدادات",
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomSwitchListTile(
            title: 'عرض الأيام',
            value: cubit.showDaysRow,
            onChanged: (value) {
              cubit.changeShowDaysRow(value);
            },
          ),
          CustomSwitchListTile(
            title: 'عرض اسم النشاط',
            value: cubit.showStickyArea,
            onChanged: (value) {
              cubit.changeShowStickyArea(value);
            },
          ),
          CustomSwitchListTile(
            title: 'تحديد التاريخ',
            value: cubit.customWeekHeader,
            onChanged: (value) {
              cubit.changeCustomWeekHeader(value);
            },
          ),
          CustomSwitchListTile(
            title: 'تحديد الأيام',
            value: cubit.customDayHeader,
            onChanged: (value) {
              cubit.changeCustomDayHeader(value);
            },
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
