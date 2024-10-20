import '/features/settings/presentation/manager/setting_projects_cubit/setting_projects_cubit.dart';
import '/features/settings/presentation/manager/setting_company_cubit/setting_company_cubit.dart';
import '/features/settings/presentation/manager/setting_cubit/setting_cubit.dart';
import '/features/settings/data/repository/company_info_implement.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/setting_view_body.dart';
import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SettingCubit(),
        ),
        BlocProvider(
          create: (context) => SettingCompanyCubit(
            CompanyInfoImplement(),
          )..getCompanyInfo(),
        ),
        BlocProvider(
          create: (context) => SettingProjectsCubit(),
        ),
      ],
      child: const SettingViewBody(),
    );
  }
}
