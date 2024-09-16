import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';
import 'form_label_widget.dart';

class InformationCard extends StatelessWidget {
  final String label;
  final String value;
  final String? email;
  final Widget? detailButtonWidget;
  final bool priceColor;
  final double? width;

  const InformationCard({
    super.key,
    this.detailButtonWidget,
    required this.value,
    required this.label,
    this.email,
    this.width,
    this.priceColor = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          color: AppColors.kPrimaryColor,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                FormWidgetWithLabel(
                  label,
                  value: value,
                  priceColor: priceColor,
                  width: width,
                ),
                if (detailButtonWidget != null) const Spacer(),
                if (detailButtonWidget != null) detailButtonWidget!
              ],
            ),
            if (email != null)
              Text(
                email!,
                style: AppStyle.kTextStyle14.copyWith(
                  color: Colors.grey,
                ),
              )
          ],
        ),
      ),
    );
  }
}
