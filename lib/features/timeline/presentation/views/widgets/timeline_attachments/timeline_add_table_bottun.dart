import '/features/timeline/presentation/manager/timeline_attachments_cubit/timeline_attachments_state.dart';
import '/features/timeline/presentation/manager/timeline_attachments_cubit/timeline_attachments_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/utils/show_toast.dart';
import '/core/models/step_type.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class TimelineAddTableBottun extends StatelessWidget {
  final ProjectDetails projectDetails;
  final StepType stepType;
  const TimelineAddTableBottun({
    super.key,
    required this.projectDetails,
    required this.stepType,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<TimelineAttachmentsCubit>();
    return BlocConsumer<TimelineAttachmentsCubit, TimelineAttachmentsState>(
      listener: (context, state) {
        if (state is AddTimelineTableSuccess) {
          ShowToast.show(
            success: true,
            context: context,
            msg: "تم اضافة الجدول",
          );
        }
        if (state is AddTimelineTableFailure) {
          ShowToast.show(
            context: context,
            msg: state.errMessage,
          );
        }
      },
      builder: (context, state) {
        return InkWell(
          onTap: () => cubit.addTimeLineTable(
            projectId: projectDetails.id!,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "اضافة الجدول",
              // timelineData.isEmpty ? "اضافة الجدول" : "تعديل الجدول",
              style: AppStyle.tabTextStyle.copyWith(
                color: AppColors.kPrimaryColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
