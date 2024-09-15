import 'widgets/setting_company_info.dart';
import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(8.0),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              SettingCompanyInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
