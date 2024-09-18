import '/core/widgets/custom_list_tile_validator.dart';
import 'package:flutter/material.dart';

class AddNewOutcomingLetterTakeFile extends StatelessWidget {
  const AddNewOutcomingLetterTakeFile({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomListTileValidator(
      title: "ارفاق نموذج الخطاب",
      onTap: () {},
      leading: const Icon(Icons.file_copy_outlined),
    );
  }
}
