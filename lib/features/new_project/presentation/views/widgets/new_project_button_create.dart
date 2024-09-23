import '/features/new_project/presentation/manager/new_project_cubit/new_project_cubit.dart';
import '/features/new_project/presentation/manager/new_project_cubit/new_project_state.dart';
import '/features/settings/presentation/manager/cubit/setting_cubit.dart';
import '/features/new_project/data/models/new_project_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/utils/show_toast.dart';

class NewProjectButtonCreate extends StatelessWidget {
  const NewProjectButtonCreate({super.key});

  @override
  Widget build(BuildContext context) {
    NewProjectCubit cubit = BlocProvider.of<NewProjectCubit>(context);
    SettingCubit settingCubit = BlocProvider.of<SettingCubit>(context);
    return BlocConsumer<NewProjectCubit, NewProjectState>(
      listener: (context, state) {
        if (state is NewProjectSuccess) {
          ShowToast.show(
            context: context,
            msg: 'تم انشاء المشروع بنجاح',
            success: true,
          );
          cubit.projectName.clear();
          cubit.projectNumber.clear();
          cubit.projectPrice.clear();
          cubit.projectDurationPerDay.clear();
          cubit.projectManager.clear();
          cubit.projectOwner.clear();
          cubit.projectArea.clear();
          cubit.projectCity.clear();
          cubit.projectDatePo = null;
          cubit.projectReceiptDate = null;
          cubit.projectFilePo = null;
        }
        if (state is NewProjectFailure) {
          ShowToast.show(
            context: context,
            msg: state.errMessage,
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is NewProjectLoading,
          text: 'انشاء',
          onPressed: () {
            cubit.validatorProjectDateField();
            cubit.validatorProjectReceiptDateField();
            cubit.validatorTakePoFileField();
            bool validateFields = cubit.formKey.currentState!.validate();
            if (validateFields &&
                cubit.projectDatePoValidator &&
                cubit.projectReceiptDateValidator &&
                cubit.projectPickFilePoValidator) {
              cubit.createNewProject(
                projectBasicData: NewProjectModel(
                  projectName: cubit.projectName.text,
                  projectNumber: cubit.projectNumber.text,
                  projectPrice: double.parse(
                    cubit.projectPrice.text,
                  ),
                  projectDurationPerDay: int.parse(
                    cubit.projectDurationPerDay.text,
                  ),
                  projectManager: cubit.projectManager.text,
                  projectOwner: cubit.projectOwner.text,
                  projectArea: cubit.projectArea.text,
                  projectCity: cubit.projectCity.text,
                  projectReceiptDate: cubit.projectReceiptDate.toString(),
                  projectDatePo: cubit.projectDatePo.toString(),
                  projectFilePo: cubit.projectFilePo!,
                  projectValueAddedTax: double.parse(
                    settingCubit.valueAddedTax.text,
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
