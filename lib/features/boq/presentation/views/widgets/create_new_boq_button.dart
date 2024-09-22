import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/boq/presentation/manager/add_boq_cubit/add_boq_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import 'create_new_boq_dialog.dart';
import '/core/constant/style.dart';

class CreateNewBoqButton extends StatelessWidget {
  final ProjectDetails projectDetails;

  const CreateNewBoqButton({
    super.key,
    required this.projectDetails,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => BlocProvider.value(
            value: BlocProvider.of<AddBoqCubit>(context),
            child: CreateNewBoqDialog(
              projectDetails: projectDetails,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "اضافة جدول معدل جديد",
          style: AppStyle.tabTextStyle.copyWith(
            color: AppColors.kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
