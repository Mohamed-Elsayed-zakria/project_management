import '/features/timeline/presentation/manager/follow_timeline_cubit/follow_timeline_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'follow_timeline_setting_dialog.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class FollowTimelineSettingButton extends StatelessWidget {
  const FollowTimelineSettingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (_) {
          return BlocProvider.value(
            value: context.read<FollowTimelineCubit>(),
            child: const FollowTimelineSettingDialog(),
          );
        },
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "اعدادات",
          style: AppStyle.tabTextStyle.copyWith(
            color: AppColors.kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
