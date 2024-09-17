import '/features/new_project/presentation/manager/new_project_cubit/new_project_cubit.dart';
import '/features/new_project/presentation/manager/new_project_cubit/new_project_state.dart';
import '/core/widgets/custom_list_tile_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class NewProjectTakeDatePo extends StatelessWidget {
  const NewProjectTakeDatePo({super.key});

  @override
  Widget build(BuildContext context) {
    NewProjectCubit blocAccess = BlocProvider.of<NewProjectCubit>(context);
    return BlocBuilder<NewProjectCubit, NewProjectState>(
      builder: (context, state) {
        DateTime? dateTime = blocAccess.projectDatePo;
        return CustomListTileValidator(
          validator: blocAccess.projectDatePoValidator,
          onTap: () async =>
              await blocAccess.customShowDatePicker(context: context),
          title: blocAccess.projectDatePo == null
              ? 'تاريخ - PO'
              : "${dateTime!.year}/${dateTime.month}/${dateTime.day}",
          leading: const Icon(Icons.date_range_outlined),
        );
      },
    );
  }
}
