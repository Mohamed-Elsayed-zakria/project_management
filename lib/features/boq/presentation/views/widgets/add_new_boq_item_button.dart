import '/features/boq/presentation/manager/add_boq_item_cubit/add_boq_item_cubit.dart';
import '/features/boq/data/models/boq_data/boq_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'add_boq_item_data_dialog.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class AddNewBoqItemButton extends StatelessWidget {
  final BoqData boqData;

  const AddNewBoqItemButton({
    super.key,
    required this.boqData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => BlocProvider.value(
            value: BlocProvider.of<AddBoqItemCubit>(context),
            child: AddBoqItemDataDialog(
              boqData: boqData,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Text(
          "اضافة",
          style: AppStyle.tabTextStyle.copyWith(
            color: AppColors.kPrimaryColor,
          ),
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
