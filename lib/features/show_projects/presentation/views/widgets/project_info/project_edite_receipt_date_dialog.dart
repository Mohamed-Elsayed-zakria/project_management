import '/features/show_projects/presentation/manager/project_info_cubit/project_info_state.dart';
import '/features/show_projects/presentation/manager/project_info_cubit/project_info_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import '/core/widgets/custom_list_tile_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/utils/my_date_util.dart';
import '/core/routes/app_pages.dart';
import '/core/utils/show_toast.dart';
import '/core/constant/style.dart';

class ProjectEditeReceiptDateDialog extends StatelessWidget {
  final ProjectDetails projectDetails;
  const ProjectEditeReceiptDateDialog({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    ProjectInfoCubit cubit = BlocProvider.of<ProjectInfoCubit>(context);
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      title: const Text(
        "تعديل مدة المشروع باليوم",
        textAlign: TextAlign.center,
        style: AppStyle.kTextStyle20,
      ),
      contentPadding: const EdgeInsets.all(14),
      content: Container(
        constraints: const BoxConstraints(maxWidth: 360),
        child: BlocConsumer<ProjectInfoCubit, ProjectInfoState>(
          listener: (context, state) {
            if (state is UpdateProjectSuccess) {
              cubit.projectReceiptDate = null;
              AppPages.back(context);
            }
            if (state is UpdateProjectFailure) {
              ShowToast.show(
                context: context,
                msg: state.errMessage,
              );
            }
          },
          builder: (context, state) {
            DateTime? dateTime = cubit.projectReceiptDate;
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10),
                CustomListTileValidator(
                  validator: cubit.projectReceiptDateValidator,
                  onTap: () async =>
                      await cubit.projectReceiptDatePicker(context: context),
                  title: cubit.projectReceiptDate == null
                      ? MyDateUtil.convertDateTime(
                          historyAsText: projectDetails.projectReceiptDate!,
                        )
                      : "${dateTime!.year}/${dateTime.month}/${dateTime.day}",
                  leading: const Icon(Icons.date_range_outlined),
                ),
                const SizedBox(height: 10),
                CustomButton(
                  isLoading: state is UpdateProjectLoading,
                  text: 'تعديل',
                  onPressed: () {
                    cubit.validatorProjectReceiptDateField();
                    if (cubit.projectReceiptDateValidator) {
                      cubit.changeProjectReceiptDate(
                        projectDetails: projectDetails,
                        newDate: cubit.projectReceiptDate.toString(),
                      );
                    }
                  },
                ),
                const SizedBox(height: 10),
              ],
            );
          },
        ),
      ),
    );
  }
}
