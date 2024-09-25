import '/features/letters/presentation/manager/outgoing_letter_cubit/outgoing_letter_cubit.dart';
import '/features/letters/presentation/manager/outgoing_letter_cubit/outgoing_letter_state.dart';
import '/core/widgets/custom_list_tile_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AddNewOutcomingLetterTakeFile extends StatelessWidget {
  const AddNewOutcomingLetterTakeFile({super.key});

  @override
  Widget build(BuildContext context) {
    OutgoingLetterCubit cubit = BlocProvider.of<OutgoingLetterCubit>(context);
    return BlocBuilder<OutgoingLetterCubit, OutgoingLetterState>(
      builder: (context, state) {
        return CustomListTileValidator(
          validator: cubit.addLetterFileValidator,
          title: cubit.addLetterFile == null
              ? "ارفاق نموذج الخطاب"
              : "تم ارفاق النموذج",
          leading: const Icon(Icons.file_copy_outlined),
          onTap: () => cubit.pickLetterFile(),
        );
      },
    );
  }
}
