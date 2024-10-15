import '/features/timeline/presentation/manager/timeline_attachments_cubit/timeline_attachments_cubit.dart';
import '/features/timeline/presentation/manager/timeline_attachments_cubit/timeline_attachments_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class CustomLinearProgress extends StatelessWidget {
  const CustomLinearProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimelineAttachmentsCubit, TimelineAttachmentsState>(
      builder: (context, state) {
        return Visibility(
          visible: state is AddTimelineTableLoading,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: LinearProgressIndicator(),
          ),
        );
      },
    );
  }
}
