import 'edit_company_elements/setting_edite_commercial_registration_number.dart';
import 'edit_company_elements/setting_edite_company_name.dart';
import 'edit_company_elements/setting_edite_phone_number.dart';
import 'edit_company_elements/setting_edite_address.dart';
import 'edit_company_elements/setting_edite_website.dart';
import 'setting_copmany_add_new_file.dart';
import 'setting_company_files_title.dart';
import 'setting_company_info_title.dart';
import 'setting_company_file_item.dart';
import 'package:flutter/material.dart';

class SettingCompanyInfo extends StatelessWidget {
  const SettingCompanyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    const double maxWidth = 700;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SettingCompanyInfoTitle(),
        Container(
          constraints: const BoxConstraints(maxWidth: maxWidth),
          child: const Column(
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
        ),
        const SettingCompanyFilesTitle(),
        const SettingCopmanyAddNewFile(),
        Container(
          constraints: const BoxConstraints(maxWidth: maxWidth),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 6,
            itemBuilder: (context, index) {
              return SettingCompanyFileItem(
                fileName: "$index اسم الملف",
              );
            },
          ),
        )
      ],
    );
  }
}
