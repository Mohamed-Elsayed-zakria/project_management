import '/core/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class SettingEditCompanyInfo extends StatelessWidget {
  const SettingEditCompanyInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomFormField(
          label: 'اسم الشركة',
          hintText: 'ادخل اسم الشركة',
        ),
        CustomFormField(
          label: "رقم السجل التجاري",
          hintText: "ادخل رقم السجل التجاري",
        ),
        CustomFormField(
          label: 'رقم الهاتف',
          hintText: "ادخل رقم الهاتف",
        ),
        CustomFormField(
          label: "العنوان",
          hintText: "ادخل العنوان",
        ),
        CustomFormField(
          label: "الموقع الالكتروني",
          hintText: "ادخل الموقع الالكتروني",
        ),
      ],
    );
  }
}
