import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/forms/presentation/manager/forms_cubit/forms_cubit.dart';
import '/features/forms/data/repository/forms_implement.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/site_receipt_view_body.dart';
import 'package:flutter/material.dart';

class SiteReceiptView extends StatelessWidget {
  final ProjectDetails projectDetails;

  const SiteReceiptView({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormsCubit(FormsImplement()),
      child: SiteReceiptViewBody(
        projectDetails: projectDetails,
      ),
    );
  }
}
