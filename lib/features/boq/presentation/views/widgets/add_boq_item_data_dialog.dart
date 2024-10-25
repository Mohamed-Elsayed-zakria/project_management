import '/features/boq/presentation/manager/boq_item_cubit/boq_item_cubit.dart';
import '/features/boq/data/models/boq_data/boq_data.dart';
import '/core/widgets/custom_alert_dialog.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/core/utils/parse_arabic_number.dart';
import '/core/widgets/custom_form_field.dart';
import 'add_boq_item_data_dialog_button.dart';
import 'package:flutter/material.dart';

class AddBoqItemDataDialog extends StatelessWidget {
  final BoqData boqData;

  const AddBoqItemDataDialog({
    super.key,
    required this.boqData,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<BoqItemCubit>();
    return CustomAlertDialog(
      title: "اضافة جديدة",
      content: Form(
        key: cubit.addBoqItemformKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            CustomFormField(
              controller: cubit.itemNumberGetText,
              label: "الرقم",
              hintText: "ادخل الرقم",
              prefixIcon: const Icon(Icons.numbers_outlined),
              validator: (value) {
                if (value!.isEmpty) {
                  return "مطلوب";
                } else {
                  return null;
                }
              },
            ),
            CustomFormField(
              controller: cubit.itemGetText,
              label: "البند",
              hintText: "ادخل البند",
              prefixIcon: const Icon(Icons.list_alt_outlined),
              validator: (value) {
                if (value!.isEmpty) {
                  return "مطلوب";
                } else {
                  return null;
                }
              },
            ),
            CustomFormField(
              controller: cubit.quantityGetText,
              label: "الكمية",
              hintText: "ادخل الكمية",
              prefixIcon: const Icon(Icons.production_quantity_limits_outlined),
              validator: (value) {
                int? quantity = ParseArabicNumber.parseArabicNumber(
                  cubit.quantityGetText.text,
                );
                if (value!.isEmpty) {
                  return "مطلوب";
                } else if (quantity == null) {
                  return "خطأ في الكمية";
                } else {
                  return null;
                }
              },
            ),
            CustomFormField(
              controller: cubit.individualPriceGetText,
              label: "السعر الافرادي",
              hintText: "ادخل السعر الافرادي",
              prefixIcon: const Icon(Icons.price_change_outlined),
              validator: (value) {
                double? individualPrice =
                    ParseArabicNumber.parseArabicNumberPrice(
                  cubit.individualPriceGetText.text,
                );
                if (value!.isEmpty) {
                  return "مطلوب";
                } else if (individualPrice == null) {
                  return "خطأ في السعر";
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 10),
            AddBoqItemDataDialogButton(boqData: boqData),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
