import '/features/settings/presentation/manager/setting_projects_cubit/setting_projects_state.dart';
import '/features/settings/presentation/manager/setting_projects_cubit/setting_projects_cubit.dart';
import '/features/settings/presentation/views/widgets/setting_custom_dialog_edit_info.dart';
import '/features/settings/data/models/add_project_settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_form_field.dart';
import '/core/utils/parse_arabic_number.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';
import '/core/utils/show_toast.dart';

class SettingEditeTax extends StatelessWidget {
  const SettingEditeTax({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SettingProjectsCubit>();
    cubit.valueAddedTax.text =
        cubit.projectSettings.valueAddedTax?.toString() ?? '--';
    return BlocConsumer<SettingProjectsCubit, SettingProjectsState>(
      listener: (context, state) {
        if (state is UpdateSettingProjectsSuccess) {
          cubit.valueAddedTax.text =
              cubit.projectSettings.valueAddedTax?.toString() ?? '--';
        }
        if (state is UpdateSettingProjectsFailure) {
          ShowToast.show(
            context: context,
            msg: state.message,
          );
        }
      },
      builder: (context, state) {
        return ListTile(
          title: const Text("ضريبة القيمة المضافة"),
          subtitle: Text("${(cubit.valueAddedTax.text)} %"),
          trailing: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => BlocProvider.value(
                  value: cubit,
                  child:
                      BlocListener<SettingProjectsCubit, SettingProjectsState>(
                    listener: (context, state) {
                      if (state is UpdateSettingProjectsSuccess) {
                        AppPages.back(context);
                      }
                    },
                    child: SettingCustomDialogEditInfo(
                      isLoading: state is UpdateSettingProjectsLoading,
                      title: "ضريبة القيمة المضافة",
                      content: CustomFormField(
                        controller: cubit.valueAddedTax,
                        label: "القيمة المضافة",
                        hintText: "ادخل الضريبة الجديدة",
                        validator: (value) {
                          double? valueAddedTax =
                              ParseArabicNumber.parseArabicNumberPrice(
                            cubit.valueAddedTax.text,
                          );
                          if (value!.isEmpty) {
                            return "مطلوب";
                          } else if (valueAddedTax == null) {
                            return "خطأ في الضريبة";
                          } else {
                            return null;
                          }
                        },
                      ),
                      onPressed: () {
                        cubit.updateProjectSettings(
                          projectSettingsData: AddProjectSettings(
                            valueAddedTax: double.parse(
                              cubit.valueAddedTax.text,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
            icon: const Icon(
              Icons.edit_outlined,
              color: Colors.green,
            ),
          ),
        );
      },
    );
  }
}
