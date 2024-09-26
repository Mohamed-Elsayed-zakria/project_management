import '/features/show_projects/presentation/views/widgets/project_details_form_shape_list_tile.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/forms/presentation/manager/forms_cubit/forms_cubit.dart';
import '/features/forms/presentation/manager/forms_cubit/forms_state.dart';
import '/features/forms/data/models/form_data/form_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/empty_placeholder.dart';
import '/core/widgets/loading_widget.dart';
import '/core/models/files_nav_data.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/models/step_type.dart';
import '/core/routes/app_pages.dart';
import 'forms_header.dart';

class FormsViewBody extends StatefulWidget {
  final ProjectDetails projectDetails;
  final StepType stepType;

  const FormsViewBody({
    super.key,
    required this.projectDetails,
    required this.stepType,
  });

  @override
  State<FormsViewBody> createState() => _FormsViewBodyState();
}

class _FormsViewBodyState extends State<FormsViewBody> {
  FormsCubit get _cubit => context.read<FormsCubit>();
  @override
  void initState() {
    _cubit.getAllForm(
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
          FormsHeader(
            projectDetails: widget.projectDetails,
            stepType: widget.stepType,
          ),
          const SizedBox(height: 10),
          BlocBuilder<FormsCubit, FormsState>(
            builder: (context, state) {
              if (state is FormsSuccess) {
                List<FormData> formDataList = _cubit.formDataList;
                return Expanded(
                  child: formDataList.isNotEmpty
                      ? ListView.separated(
                          itemCount: formDataList.length,
                          itemBuilder: (context, index) {
                            FormData formData = formDataList[index];
                            return ProjectDetailsFormShapeListTile(
                              projectDetails: widget.projectDetails,
                              title: formData.formNumber ?? "--",
                              subtitle: formData.formDescription ?? "--",
                              formFile: formData.formFile,
                              outgoingIncomingLettersOnTap: () => AppPages.to(
                                data: FilesNavData(
                                  projectDetails: widget.projectDetails,
                                  stepType: widget.stepType,
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
              }
              if (state is FormsFailure) {
                return Center(
                  child: Text(state.errMessage),
                );
              }
              return const Expanded(
                child: Center(
                  child: LoadingWidget(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
