import '../../manager/incoming_letter_cubit/incoming_letter_cubit.dart';
import '../../manager/incoming_letter_cubit/incoming_letter_state.dart';
import '/core/widgets/custom_list_tile_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AddNewIncomingLetterTakeDate extends StatelessWidget {
  const AddNewIncomingLetterTakeDate({super.key});

  @override
  Widget build(BuildContext context) {
    IncomingLetterCubit blocAccess =
        BlocProvider.of<IncomingLetterCubit>(context);
    return BlocBuilder<IncomingLetterCubit, IncomingLetterState>(
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
