import '/features/show_projects/presentation/views/widgets/project_details_form_shape_list_tile.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/forms/presentation/manager/forms_cubit/forms_cubit.dart';
import '/features/forms/presentation/manager/forms_cubit/forms_state.dart';
import '/features/forms/data/models/form_data/form_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/empty_placeholder.dart';
import '/core/widgets/loading_widget.dart';
import '/core/models/enums/step_type.dart';
import '/core/models/files_nav_data.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_routes.dart';
import '/core/models/step_type.dart';
import '/core/routes/app_pages.dart';
import 'site_receipt_header.dart';

class SiteReceiptViewBody extends StatefulWidget {
  final ProjectDetails projectDetails;

  const SiteReceiptViewBody({
    super.key,
    required this.projectDetails,
  });

  @override
  State<SiteReceiptViewBody> createState() => _SiteReceiptViewBodyState();
}

class _SiteReceiptViewBodyState extends State<SiteReceiptViewBody> {
  FormsCubit get _cubit => context.read<FormsCubit>();
  @override
  void initState() {
    _cubit.getAllForm(
      projectId: widget.projectDetails.id!,
      stepType: StepType(
        stepType: StepTypeName.siteReceipt.name,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Card(
        elevation: 3,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ProjectDetailsSiteReceiptHeader(
                projectDetails: widget.projectDetails,
              ),
              const SizedBox(height: 10),
              BlocBuilder<FormsCubit, FormsState>(
                builder: (context, state) {
                  if (state is FormsLoading) {
                    return const Expanded(
                      child: Center(
                        child: LoadingWidget(),
                      ),
                    );
                  }
                  if (state is FormsFailure) {
                    return Center(
                      child: Text(state.errMessage),
                    );
                  }
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
                                    stepType: StepType(
                                      stepType: StepTypeName.siteReceipt.name,
                                      stepTypeId: formData.id,
                                    ),
                                  ),
                                  path: AppRoutes.incomingOutgoingLetters,
                                  context: context,
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const Divider(),
                          )
                        : const EmptyPlaceholder(message: "لا يوجد نماذج"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
