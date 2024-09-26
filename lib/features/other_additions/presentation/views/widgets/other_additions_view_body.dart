import '/features/other_additions/presentation/manager/other_additions_cubit/other_additions_cubit.dart';
import '/features/other_additions/presentation/manager/other_additions_cubit/other_additions_state.dart';
import '/features/show_projects/presentation/views/widgets/project_details_form_shape_list_tile.dart';
import '/features/other_additions/data/models/other_additions_data/other_additions_data.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/empty_placeholder.dart';
import '/core/widgets/loading_widget.dart';
import '/core/models/files_nav_data.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import 'other_additions_header.dart';
import '/core/models/step_type.dart';
import '/core/routes/app_pages.dart';

class OtherAdditionsViewBody extends StatefulWidget {
  final ProjectDetails projectDetails;
  final StepType stepType;
  const OtherAdditionsViewBody({
    super.key,
    required this.projectDetails,
    required this.stepType,
  });

  @override
  State<OtherAdditionsViewBody> createState() => _OtherAdditionsViewBodyState();
}

class _OtherAdditionsViewBodyState extends State<OtherAdditionsViewBody> {
  OtherAdditionsCubit get _cubit => context.read<OtherAdditionsCubit>();
  @override
  void initState() {
    _cubit.getAllOtherAdditions(
      projectId: widget.projectDetails.id!,
      stepType: widget.stepType,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          OtherAdditionsHeader(
            projectDetails: widget.projectDetails,
            stepType: widget.stepType,
          ),
          const SizedBox(height: 10),
          BlocBuilder<OtherAdditionsCubit, OtherAdditionsState>(
            builder: (context, state) {
              if (state is OtherAdditionsLoading) {
                return const Expanded(
                  child: Center(
                    child: LoadingWidget(),
                  ),
                );
              }
              if (state is OtherAdditionsFailure) {
                return Center(
                  child: Text(state.errMessage),
                );
              }
              List<OtherAdditionsData> otherAdditionsData =
                  _cubit.otherAdditionsData;
              return Expanded(
                child: otherAdditionsData.isNotEmpty
                    ? ListView.separated(
                        itemCount: otherAdditionsData.length,
                        itemBuilder: (context, index) {
                          OtherAdditionsData formData =
                              otherAdditionsData[index];
                          return ProjectDetailsFormShapeListTile(
                            projectDetails: widget.projectDetails,
                            title: formData.number ?? "--",
                            subtitle: formData.description ?? "--",
                            formFile: formData.formFile,
                            outgoingIncomingLettersOnTap: () => AppPages.to(
                              data: FilesNavData(
                                projectDetails: widget.projectDetails,
                                stepType: StepType(
                                  stepType: widget.stepType.stepType,
                                  stepTypeId: formData.id,
                                ),
                              ),
                              path: AppRoutes.incomingOutgoingLetters,
                              context: context,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const Divider(),
                      )
                    : const EmptyPlaceholder(message: "لا يوجد نماذج"),
              );
            },
          ),
        ],
      ),
    );
  }
}
