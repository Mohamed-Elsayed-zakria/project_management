import '/features/show_projects/data/models/project_details/project_details.dart';
import '/features/boq/presentation/manager/fetch_boq_cubit/fetch_boq_cubit.dart';
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
        FetchBoqCubit fetchBoqCubit = BlocProvider.of<FetchBoqCubit>(context);
        AddBoqCubit addBoqCubit = BlocProvider.of<AddBoqCubit>(context);
        showDialog(
          context: context,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: fetchBoqCubit),
              BlocProvider.value(value: addBoqCubit),
            ],
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
