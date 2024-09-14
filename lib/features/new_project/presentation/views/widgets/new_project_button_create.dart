import '/features/new_project/presentation/manager/new_project_cubit/new_project_cubit.dart';
import '/features/new_project/presentation/manager/new_project_cubit/new_project_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            if (blocAccess.formKey.currentState!.validate()) {
              blocAccess.createNewProject();
            }
          },
        );
      },
    );
  }
}
