import '/features/show_projects/presentation/manager/project_info_cubit/project_info_state.dart';
import '/features/show_projects/presentation/manager/project_info_cubit/project_info_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import '/core/widgets/custom_list_tile_validator.dart';
import '/core/widgets/custom_alert_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/utils/my_date_util.dart';
import '/core/routes/app_pages.dart';

class ProjectEditeDatePoDialog extends StatelessWidget {
  final ProjectDetails projectDetails;
  const ProjectEditeDatePoDialog({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ProjectInfoCubit>();
    return CustomAlertDialog(
      title: "تعديل مدة المشروع باليوم",
      content: BlocConsumer<ProjectInfoCubit, ProjectInfoState>(
        listener: (context, state) {
          if (state is UpdateProjectSuccess) {
            cubit.projectDatePo = null;
            AppPages.back(context);
          }
        },
        builder: (context, state) {
          DateTime? dateTime = cubit.projectDatePo;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              CustomListTileValidator(
                validator: cubit.projectDatePoValidator,
                onTap: () async =>
                    await cubit.customShowDatePicker(context: context),
                title: cubit.projectDatePo == null
                    ? MyDateUtil.convertDateTime(
                        historyAsText: projectDetails.projectDatePo!,
                      )
                    : "${dateTime!.year}/${dateTime.month}/${dateTime.day}",
                leading: const Icon(Icons.date_range_outlined),
              ),
              const SizedBox(height: 10),
              CustomButton(
                isLoading: state is UpdateProjectLoading,
                text: 'تعديل',
                onPressed: () {
                  cubit.validatorTakePoFileField();
                  if (cubit.projectDatePoValidator) {
                    cubit.changeProjectDatePo(
                      newDate: cubit.projectDatePo.toString(),
                      projectDetails: projectDetails,
                    );
                  }
                },
              ),
              const SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }
}
