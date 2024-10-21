import '/features/settings/presentation/manager/setting_company_cubit/setting_company_cubit.dart';
import '/features/settings/presentation/manager/setting_company_cubit/setting_company_state.dart';
import 'edit_company_elements/setting_edite_commercial_registration_number.dart';
import '/features/settings/data/models/company_info/company_file.dart';
import 'edit_company_elements/setting_edite_company_name.dart';
import 'edit_company_elements/setting_edite_phone_number.dart';
import 'edit_company_elements/setting_edite_address.dart';
import 'edit_company_elements/setting_edite_website.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/empty_placeholder.dart';
import '/core/widgets/loading_widget.dart';
import 'setting_copmany_add_new_file.dart';
import 'setting_company_files_title.dart';
import 'setting_company_info_title.dart';
import 'setting_company_file_item.dart';
import 'package:flutter/material.dart';
import '/core/utils/show_toast.dart';
import '/core/constant/style.dart';

class SettingCompanyInfo extends StatelessWidget {
  const SettingCompanyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SettingCompanyCubit>(context);
    const double maxWidth = 750;
    return BlocBuilder<SettingCompanyCubit, SettingCompanyState>(
      builder: (context, state) {
        if (state is SettingCompanyLoading) {
          return const Center(
            child: LoadingWidget(),
          );
        }
        if (state is SettingCompanyFailure) {
          return Center(
            child: Text(
              state.message,
              style: AppStyle.tabTextStyle,
            ),
          );
        }
        return Container(
          constraints: const BoxConstraints(maxWidth: maxWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SettingCompanyInfoTitle(),
              const Column(
                children: [
                  SettingEditeCompanyName(),
                  Divider(),
                  SettingEditeCommercialRegistrationNumber(),
                  Divider(),
                  SettingEditePhoneNumber(),
                  Divider(),
                  SettingEditeAddress(),
                  Divider(),
                  SettingEditeWebsite(),
                  Divider(),
                ],
              ),
              const SettingCompanyFilesTitle(),
              const SettingCopmanyAddNewFile(),
              BlocConsumer<SettingCompanyCubit, SettingCompanyState>(
                listener: (context, state) {
                  if (state is UpdateCompanySuccess) {
                    ShowToast.show(
                      context: context,
                      msg: "تم التحديث",
                      success: true,
                    );
                  }
                  if (state is CompanyFileSuccess) {
                    ShowToast.show(
                      context: context,
                      msg: "تم إضافة الملف",
                      success: true,
                    );
                  }
                  if (state is CompanyFileFailure) {
                    ShowToast.show(
                      context: context,
                      msg: state.message,
                    );
                  }
                },
                builder: (context, state) {
                  return cubit.companyInfoResult.companyFiles?.isNotEmpty ??
                          false
                      ? ListView.builder(
                          itemCount:
                              cubit.companyInfoResult.companyFiles?.length ?? 0,
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            CompanyFile companyFile =
                                cubit.companyInfoResult.companyFiles![index];
                            return SettingCompanyFileItem(
                              companyFile: companyFile,
                            );
                          },
                        )
                      : const Center(
                          child: EmptyPlaceholder(
                            message: "لا يوجد ملفات للشركة",
                          ),
                        );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
