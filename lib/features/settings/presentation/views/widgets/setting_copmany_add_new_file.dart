import 'package:flutter/material.dart';
import '/features/settings/presentation/manager/setting_company_cubit/setting_company_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class SettingCopmanyAddNewFile extends StatelessWidget {
  const SettingCopmanyAddNewFile({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SettingCompanyCubit>(context);
    return Padding(
      padding: const EdgeInsets.all(4),
      child: InkWell(
        onTap: () => cubit.addCompanyFile(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "اضافة ملف جديد",
            style: AppStyle.tabTextStyle.copyWith(
              color: AppColors.kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
