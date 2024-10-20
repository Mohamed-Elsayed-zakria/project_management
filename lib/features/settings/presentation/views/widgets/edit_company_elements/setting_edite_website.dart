import '/features/settings/presentation/manager/setting_company_cubit/setting_company_state.dart';
import '/features/settings/presentation/manager/setting_company_cubit/setting_company_cubit.dart';
import '/features/settings/presentation/views/widgets/setting_custom_dialog_edit_info.dart';
import '/features/settings/data/models/add_company_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';
import '/core/utils/show_toast.dart';
import '/core/routes/app_pages.dart';

class SettingEditeWebsite extends StatelessWidget {
  const SettingEditeWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<SettingCompanyCubit>(context);
    TextEditingController controller = TextEditingController(
      text: cubit.companyInfoResult.website ?? "",
    );
    return BlocConsumer<SettingCompanyCubit, SettingCompanyState>(
      listener: (context, state) {
        if (state is UpdateCompanySuccess) {
          controller = TextEditingController(
            text: cubit.companyInfoResult.website ?? "",
          );
        }
        if (state is UpdateCompanyFailure) {
          ShowToast.show(
            context: context,
            msg: state.message,
          );
        }
      },
      builder: (context, state) {
        return ListTile(
          title: const Text("الموقع الالكتروني"),
          subtitle: Text(cubit.companyInfoResult.website ?? "--"),
          trailing: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => BlocProvider.value(
                  value: cubit,
                  child: BlocListener<SettingCompanyCubit, SettingCompanyState>(
                    listener: (context, state) {
                      if (state is UpdateCompanySuccess) {
                        AppPages.back(context);
                      }
                    },
                    child: SettingCustomDialogEditInfo(
                      isLoading: state is UpdateCompanyLoading,
                      title: "الموقع الالكتروني",
                      content: CustomFormField(
                        controller: controller,
                        label: "الموقع الالكتروني",
                        hintText: "ادخل الموقع الالكتروني الجديد",
                      ),
                      onPressed: () {
                        cubit.updateCompanyInfo(
                          companyInfo: AddCompanyInfo(
                            website: controller.text,
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
