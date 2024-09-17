import '/features/new_project/presentation/manager/new_project_cubit/new_project_cubit.dart';
import '/features/new_project/presentation/manager/new_project_cubit/new_project_state.dart';
import '/features/new_project/data/models/new_project_basic_data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/utils/parse_arabic_number.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';

class NewProjectButtonCreate extends StatelessWidget {
  const NewProjectButtonCreate({super.key});

  @override
  Widget build(BuildContext context) {
    NewProjectCubit blocAccess = BlocProvider.of<NewProjectCubit>(context);
    return BlocConsumer<NewProjectCubit, NewProjectState>(
      listener: (context, state) {
        if (state is NewProjectSuccess) {
          // TODO: create toast
          blocAccess.projectName.clear();
          blocAccess.projectNumber.clear();
          blocAccess.projectPrice.clear();
          blocAccess.projectDurationPerDay.clear();
          blocAccess.projectManager.clear();
          blocAccess.projectOwner.clear();
          blocAccess.projectArea.clear();
          blocAccess.projectCity.clear();
          blocAccess.projectDatePo = null;
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
            blocAccess.validatorProjectDateField();
            bool validateFields = blocAccess.formKey.currentState!.validate();
            if (validateFields && blocAccess.projectDatePoValidator) {
              double? projectPrice = ParseArabicNumber.parseArabicNumber(
                blocAccess.projectPrice.text,
              );
              if (projectPrice == null) {
                print("========== سعر المشروع غير مكتوب بشكل صحيح");
              } else {
                blocAccess.createNewProject(
                  projectBasicData: NewProjectBasicDataModel(
                    projectName: blocAccess.projectName.text,
                    projectNumber: blocAccess.projectNumber.text,
                    projectPrice: projectPrice.toString(),
                    projectDurationPerDay:
                        blocAccess.projectDurationPerDay.text,
                    projectManager: blocAccess.projectManager.text,
                    projectOwner: blocAccess.projectOwner.text,
                    projectArea: blocAccess.projectArea.text,
                    projectCity: blocAccess.projectCity.text,
                    projectDatePo: blocAccess.projectDatePo.toString(),
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
