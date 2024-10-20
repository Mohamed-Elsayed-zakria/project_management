import '/features/settings/presentation/views/widgets/setting_custom_dialog_edit_info.dart';
import '../../../manager/setting_cubit/setting_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';

class SettingEditeTax extends StatelessWidget {
  const SettingEditeTax({super.key});

  @override
  Widget build(BuildContext context) {
    SettingCubit cubit = BlocProvider.of<SettingCubit>(context);
    return ListTile(
      title: const Text("ضريبة القيمة المضافة"),
      subtitle: Text("${(cubit.valueAddedTax.text)} %"),
      trailing: IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => SettingCustomDialogEditInfo(
              isLoading: false,
              title: "ضريبة القيمة المضافة",
              content: CustomFormField(
                controller: cubit.valueAddedTax,
                label: "القيمة المضافة",
                hintText: "ادخل الضريبة الجديدة",
              ),
              onPressed: () {
                AppPages.back(context);
              },
            ),
          );
        },
        icon: const Icon(
          Icons.edit_outlined,
          color: Colors.green,
        ),
      ),
    );
  }
}
