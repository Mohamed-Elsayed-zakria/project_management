import '/features/show_projects/presentation/manager/project_info_cubit/project_info_cubit.dart';
import '/features/show_projects/presentation/manager/project_info_cubit/project_info_state.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';
import '/core/utils/show_toast.dart';

class ProjectEditeDurationPerDayButton extends StatelessWidget {
  final ProjectDetails projectDetails;

  const ProjectEditeDurationPerDayButton({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    ProjectInfoCubit cubit = BlocProvider.of<ProjectInfoCubit>(context);
    return BlocConsumer<ProjectInfoCubit, ProjectInfoState>(
      listener: (context, state) {
        if (state is ChangeDurationPerDaySuccess) {
          cubit.editeDurationPerDay.clear();
          AppPages.back(context);
        }
        if (state is ChangeDurationPerDayFailure) {
          ShowToast.show(
            context: context,
            msg: state.errMessage,
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is ChangeDurationPerDayLoading,
          text: 'تعديل',
          onPressed: () {
            if (cubit.formKeyProjectInfo.currentState!.validate()) {
              cubit.changeDurationPerDay(
                newDuration: int.parse(cubit.editeDurationPerDay.text),
                projectDetails: projectDetails,
              );
            }
          },
        );
      },
    );
  }
}
