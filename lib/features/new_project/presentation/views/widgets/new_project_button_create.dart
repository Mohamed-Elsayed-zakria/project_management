import '/features/new_project/presentation/manager/new_project_cubit/new_project_cubit.dart';
import '/features/new_project/presentation/manager/new_project_cubit/new_project_state.dart';
import '/features/new_project/data/models/new_project_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/utils/parse_arabic_number.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';

class NewProjectButtonCreate extends StatelessWidget {
  const NewProjectButtonCreate({super.key});

  @override
  Widget build(BuildContext context) {
    NewProjectCubit cubit = BlocProvider.of<NewProjectCubit>(context);
    return BlocConsumer<NewProjectCubit, NewProjectState>(
      listener: (context, state) {
        if (state is NewProjectSuccess) {
          // TODO: create toast
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
        }
        if (state is NewProjectFailure) {
          // TODO: create toast
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is NewProjectLoading,
          text: 'انشاء',
          onPressed: () {
            cubit.validatorProjectDateField();
            cubit.validatorProjectReceiptDateField();
            bool validateFields = cubit.formKey.currentState!.validate();
            if (validateFields &&
                cubit.projectDatePoValidator &&
                cubit.projectReceiptDateValidator) {
              double? projectPrice = ParseArabicNumber.parseArabicNumber(
                cubit.projectPrice.text,
              );
              if (projectPrice == null) {
                print("========== سعر المشروع غير مكتوب بشكل صحيح");
              } else {
                cubit.createNewProject(
                  projectBasicData: NewProjectModel(
                    projectName: cubit.projectName.text,
                    projectNumber: cubit.projectNumber.text,
                    projectPrice: projectPrice.toString(),
                    projectDurationPerDay: cubit.projectDurationPerDay.text,
                    projectManager: cubit.projectManager.text,
                    projectOwner: cubit.projectOwner.text,
                    projectArea: cubit.projectArea.text,
                    projectCity: cubit.projectCity.text,
                    projectReceiptDate: cubit.projectReceiptDate.toString(),
                    projectDatePo: cubit.projectDatePo.toString(),
                    projectFilePo: "",
                    projectFilesBoq: "",
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
