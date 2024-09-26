import '/features/other_additions/presentation/manager/other_additions_cubit/other_additions_cubit.dart';
import '/features/show_projects/data/models/project_details/project_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_other_additions_dialog.dart';
import 'package:flutter/material.dart';
import '/core/models/step_type.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class OtherAdditionsAddAdditionButton extends StatelessWidget {
  final ProjectDetails projectDetails;
  final StepType stepType;
  const OtherAdditionsAddAdditionButton({
    super.key,
    required this.projectDetails,
    required this.stepType,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        OtherAdditionsCubit cubit =
            BlocProvider.of<OtherAdditionsCubit>(context);
        showDialog(
          context: context,
          builder: (context) => BlocProvider.value(
            value: cubit,
            child: AddOtherAdditionsDialog(
              projectDetails: projectDetails,
              stepType: stepType,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "اضافة عنصر جديد",
          style: AppStyle.tabTextStyle.copyWith(
            color: AppColors.kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
