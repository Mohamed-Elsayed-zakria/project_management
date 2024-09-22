import '../../manager/outgoing_letter_cubit/outgoing_letter_cubit.dart';
import '../../manager/outgoing_letter_cubit/outgoing_letter_state.dart';
import '/core/widgets/custom_list_tile_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AddNewOutcomingLetterTakeDate extends StatelessWidget {
  const AddNewOutcomingLetterTakeDate({super.key});

  @override
  Widget build(BuildContext context) {
    OutgoingLetterCubit blocAccess =
        BlocProvider.of<OutgoingLetterCubit>(context);
    return BlocBuilder<OutgoingLetterCubit, OutgoingLetterState>(
      builder: (context, state) {
        DateTime? dateTime = blocAccess.newLetterDate;
        return CustomListTileValidator(
          validator: blocAccess.newLetterDateValidator,
          onTap: () async =>
              await blocAccess.customShowDatePicker(context: context),
          title: blocAccess.newLetterDate == null
              ? 'التاريخ'
              : "${dateTime!.year}/${dateTime.month}/${dateTime.day}",
          leading: const Icon(Icons.date_range_outlined),
        );
      },
    );
  }
}
