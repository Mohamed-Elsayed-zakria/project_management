import '/features/boq/presentation/manager/boq_item_cubit/boq_item_cubit.dart';
import '/features/boq/presentation/manager/boq_item_cubit/boq_item_state.dart';
import '/features/boq/data/models/boq_data/boq_data.dart';
import '/features/boq/data/models/add_boq_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/routes/app_pages.dart';
import '/core/utils/show_toast.dart';

class AddBoqItemDataDialogButton extends StatelessWidget {
  final BoqData boqData;

  const AddBoqItemDataDialogButton({
    super.key,
    required this.boqData,
  });

  @override
  Widget build(BuildContext context) {
    BoqItemCubit cubit = BlocProvider.of<BoqItemCubit>(context);
    return BlocConsumer<BoqItemCubit, BoqItemState>(
      listener: (context, state) {
        if (state is AddBoqItemSuccess) {
          cubit.itemNumberGetText.clear();
          cubit.itemGetText.clear();
          cubit.quantityGetText.clear();
          cubit.individualPriceGetText.clear();
          AppPages.back(context);
        }
        if (state is AddBoqItemFailure) {
          ShowToast.show(
            context: context,
            msg: state.errMessage,
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: state is AddBoqItemLoading,
          text: 'اضافة',
          onPressed: () {
            if (cubit.addBoqItemformKey.currentState!.validate()) {
              cubit.addNewBoqItem(
                boqData: boqData,
                boqItemData: AddBoqItem(
                  boqId: boqData.id!,
                  itemNumber: cubit.itemNumberGetText.text,
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
