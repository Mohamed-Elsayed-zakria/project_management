import '/features/settings/presentation/manager/cubit/setting_cubit.dart';
import '/features/settings/presentation/manager/cubit/setting_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class SettingHeader extends StatelessWidget {
  const SettingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    SettingCubit cubit = BlocProvider.of<SettingCubit>(context);
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: InkWell(
                onTap: () => cubit.changeCompanySettingIsActive(),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: cubit.companySettingIsActive
                        ? AppColors.kPrimaryColor
                        : null,
                    border: Border.all(
                      color: AppColors.kPrimaryColor,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "الشركة",
                    style: AppStyle.tabTextStyle.copyWith(
                      color: cubit.companySettingIsActive
                          ? AppColors.kSurfaceColor
                          : null,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: InkWell(
                onTap: () => cubit.changeProjectSettingIsActive(),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: cubit.projectSettingIsActive
                        ? AppColors.kPrimaryColor
                        : null,
                    border: Border.all(
                      color: AppColors.kPrimaryColor,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "المشروعات",
                    style: AppStyle.tabTextStyle.copyWith(
                      color: cubit.projectSettingIsActive
                          ? AppColors.kSurfaceColor
                          : null,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
