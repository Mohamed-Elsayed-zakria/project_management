import '/features/boq/presentation/manager/add_boq_item_cubit/add_boq_item_cubit.dart';
import '/features/boq/presentation/manager/add_boq_item_cubit/add_boq_item_state.dart';
import '/features/boq/data/models/boq_data/boq_data.dart';
import '/features/boq/data/models/add_boq_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';

class AddBoqItemDataDialogButton extends StatelessWidget {
  final BoqData boqData;

  const AddBoqItemDataDialogButton({
    super.key,
    required this.boqData,
  });

  @override
  Widget build(BuildContext context) {
    AddBoqItemCubit cubit = BlocProvider.of<AddBoqItemCubit>(context);
    return BlocBuilder<AddBoqItemCubit, AddBoqItemState>(
      builder: (context, state) {
        return CustomButton(
          isLoading: state is AddBoqItemLoading,
          text: 'اضافة',
          onPressed: () {
            if (cubit.addBoqItemformKey.currentState!.validate()) {
              cubit.addNewBoqItem(
                boqItemData: AddBoqItem(
                  boqId: boqData.id!,
                  itemNumber: int.parse(
                    cubit.itemNumberGetText.text,
                  ),
                  item: cubit.itemGetText.text,
                  quantity: int.parse(
                    cubit.quantityGetText.text,
                  ),
                  individualPrice: double.parse(
                    cubit.individualPriceGetText.text,
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
