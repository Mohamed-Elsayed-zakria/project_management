import '/features/boq/presentation/manager/boq_item_cubit/boq_item_cubit.dart';
import '/features/boq/presentation/manager/boq_item_cubit/boq_item_state.dart';
import '/features/boq/data/models/boq_data/boq_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/widgets/custom_form_field.dart';
import '/core/utils/parse_arabic_number.dart';
import '/core/widgets/custom_buttom.dart';
import 'package:flutter/material.dart';
import '/core/utils/show_toast.dart';
import '/core/routes/app_pages.dart';
import '/core/constant/style.dart';

class EditeQuantityBoqDialog extends StatelessWidget {
  final BoqItem boqItemData;
  const EditeQuantityBoqDialog({
    super.key,
    required this.boqItemData,
  });

  @override
  Widget build(BuildContext context) {
    BoqItemCubit cubit = BlocProvider.of<BoqItemCubit>(context);
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      title: const Text(
        "تعديل الكمية",
        textAlign: TextAlign.center,
        style: AppStyle.kTextStyle20,
      ),
      contentPadding: const EdgeInsets.all(14),
      content: Container(
        constraints: const BoxConstraints(maxWidth: 360),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Form(
              key: cubit.updateFormKey,
              child: CustomFormField(
                controller: cubit.updateQuantityGetText,
                label: "الكمية الجديدة",
                hintText: "ادخل الكمية الجديدة",
                prefixIcon: const Icon(Icons.numbers_outlined),
                validator: (value) {
                  int? quantity = ParseArabicNumber.parseArabicNumber(
                    cubit.updateQuantityGetText.text,
                  );
                  if (value!.isEmpty) {
                    return "مطلوب";
                  } else if (quantity == null) {
                    return "خطأ في الكمية";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 10),
            BlocConsumer<BoqItemCubit, BoqItemState>(
              listener: (context, state) {
                if (state is UpdateBoqItemSuccess) {
                  cubit.updateQuantityGetText.clear();
                  AppPages.back(context);
                }
                if (state is UpdateBoqItemFailure) {
                  ShowToast.show(
                    context: context,
                    msg: state.errMessage,
                  );
                }
              },
              builder: (context, state) {
                return CustomButton(
                  isLoading: state is UpdateBoqItemLoading,
                  text: 'تعديل',
                  onPressed: () {
                    if (cubit.updateFormKey.currentState!.validate()) {
                      cubit.updateQuantityBoqItem(
                        boqItemData: boqItemData,
                        newQuantity: int.parse(
                          cubit.updateQuantityGetText.text,
                        ),
                      );
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
