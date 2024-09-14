import '/features/new_project/presentation/manager/new_project_cubit/new_project_cubit.dart';
import '/features/new_project/presentation/manager/new_project_cubit/new_project_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class NewProjectTakeData extends StatelessWidget {
  const NewProjectTakeData({super.key});

  @override
  Widget build(BuildContext context) {
    NewProjectCubit blocAccess = BlocProvider.of<NewProjectCubit>(context);
    return BlocBuilder<NewProjectCubit, NewProjectState>(
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is NewProjectLoading,
          child: Form(
            key: blocAccess.formKey,
            child: Column(
              children: [
                CustomFormField(
                  controller: blocAccess.projectName,
                  label: 'اسم المشروع',
                  hintText: 'ادخل اسم المشروع',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "مطلوب";
                    } else {
                      return null;
                    }
                  },
                ),
                CustomFormField(
                  controller: blocAccess.projectNumber,
                  label: 'رقم المشروع',
                  hintText: 'ادخل رقم المشروع',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "مطلوب";
                    } else {
                      return null;
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
