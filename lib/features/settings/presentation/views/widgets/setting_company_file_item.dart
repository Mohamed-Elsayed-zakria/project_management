import '/features/settings/presentation/manager/setting_company_cubit/setting_company_cubit.dart';
import '/features/settings/data/models/company_info/company_file.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/constant/api_end_point.dart';
import '/core/utils/url_open_file.dart';
import 'package:flutter/material.dart';

class SettingCompanyFileItem extends StatelessWidget {
  final CompanyFile companyFile;
  const SettingCompanyFileItem({
    super.key,
    required this.companyFile,
  });

  @override
  Widget build(BuildContext context) {
    SettingCompanyCubit cubit = context.read<SettingCompanyCubit>();
    String newFileName = cubit.removeDateFromFileName(companyFile.fileName);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(newFileName),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () async {
                  await UrlOpenFile.openFile(
                    "${APIEndPoint.mediaBaseUrl}${companyFile.fileName}",
                  );
                },
                icon: const Icon(
                  Icons.visibility_outlined,
                  color: Colors.blueAccent,
                ),
              ),
              IconButton(
                onPressed: () {
                  cubit.deleteCompanyFile(fileId: companyFile.id!);
                },
                icon: const Icon(
                  Icons.delete_outline,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
