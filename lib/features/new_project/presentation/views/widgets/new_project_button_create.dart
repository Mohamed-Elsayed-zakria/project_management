import '/features/new_project/presentation/manager/new_project_cubit/new_project_cubit.dart';
import '/features/new_project/presentation/manager/new_project_cubit/new_project_state.dart';
import '/features/new_project/data/models/new_project_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/utils/parse_arabic_number.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/utils/show_toast.dart';

class NewProjectButtonCreate extends StatelessWidget {
  const NewProjectButtonCreate({super.key});

  @override
  Widget build(BuildContext context) {
    NewProjectCubit cubit = BlocProvider.of<NewProjectCubit>(context);
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
              double? projectPrice = ParseArabicNumber.parseArabicNumberPrice(
                cubit.projectPrice.text,
              );
              int? durationPerDay = ParseArabicNumber.parseArabicNumber(
                cubit.projectDurationPerDay.text,
              );
              if (projectPrice == null) {
                ShowToast.show(
                  context: context,
                  msg: "خطأ في كتابة المبلغ",
                );
              } else if (durationPerDay == null) {
                ShowToast.show(
                  context: context,
                  msg: "خطأ في كتابة المدة الزمنية باليوم",
                );
              } else {
                cubit.createNewProject(
                  projectBasicData: NewProjectModel(
                    projectName: cubit.projectName.text,
                    projectNumber: cubit.projectNumber.text,
                    projectPrice: projectPrice,
                    projectDurationPerDay: durationPerDay,
                    projectManager: cubit.projectManager.text,
                    projectOwner: cubit.projectOwner.text,
                    projectArea: cubit.projectArea.text,
                    projectCity: cubit.projectCity.text,
                    projectReceiptDate: cubit.projectReceiptDate.toString(),
                    projectDatePo: cubit.projectDatePo.toString(),
                    projectFilePo: cubit.projectFilePo!,
                  ),
                );
              }
            }
          },
        );
      },
    );
  }
}
