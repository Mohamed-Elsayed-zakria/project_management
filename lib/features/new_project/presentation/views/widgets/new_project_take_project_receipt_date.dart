import '/features/new_project/presentation/manager/new_project_cubit/new_project_cubit.dart';
import '/features/new_project/presentation/manager/new_project_cubit/new_project_state.dart';
import '/core/widgets/custom_list_tile_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class NewProjectTakeProjectReceiptDate extends StatelessWidget {
  const NewProjectTakeProjectReceiptDate({super.key});

  @override
  Widget build(BuildContext context) {
    NewProjectCubit blocAccess = BlocProvider.of<NewProjectCubit>(context);
    return BlocBuilder<NewProjectCubit, NewProjectState>(
      builder: (context, state) {
        DateTime? dateTime = blocAccess.projectReceiptDate;
        return CustomListTileValidator(
          validator: blocAccess.projectReceiptDateValidator,
          onTap: () async =>
              await blocAccess.projectReceiptDatePicker(context: context),
          title: blocAccess.projectReceiptDate == null
              ? 'تاريخ استلام المشروع'
              : "${dateTime!.year}/${dateTime.month}/${dateTime.day}",
          leading: const Icon(Icons.date_range_outlined),
        );
      },
    );
  }
}
