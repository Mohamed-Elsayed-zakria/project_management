import '/features/letters/presentation/manager/incoming_letter_cubit/incoming_letter_state.dart';
import '/features/letters/presentation/manager/incoming_letter_cubit/incoming_letter_cubit.dart';
import '/core/widgets/custom_list_tile_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AddNewIncomingLetterTakeFile extends StatelessWidget {
  const AddNewIncomingLetterTakeFile({super.key});

  @override
  Widget build(BuildContext context) {
    IncomingLetterCubit cubit = BlocProvider.of<IncomingLetterCubit>(context);
    return BlocBuilder<IncomingLetterCubit, IncomingLetterState>(
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
