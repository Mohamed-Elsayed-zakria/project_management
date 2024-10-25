import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/forms/presentation/manager/forms_cubit/forms_cubit.dart';
import '/features/forms/presentation/manager/forms_cubit/forms_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'site_receipt_view_items.dart';
import 'site_receipt_header.dart';

class SiteReceiptViewBody extends StatelessWidget {
  final ProjectDetails projectDetails;

  const SiteReceiptViewBody({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<FormsCubit>();
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
                projectDetails: projectDetails,
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
                  return SiteReceiptViewItems(
                    projectDetails: projectDetails,
                    formDataList: cubit.formDataList,
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
