import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import 'form_divider.dart';

class FormWidgetWithLabel extends StatelessWidget {
  final String label;
  final String? value;
  final double labelSize;
  final Widget? child;
  final bool priceColor;
  final double? width;

  const FormWidgetWithLabel(
    this.label, {
    super.key,
    this.value,
    this.labelSize = 17,
    this.child,
    this.width,
    required this.priceColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AutoSizeText(
          label,
          maxLines: 1,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: labelSize,
          ),
        ),
        FormDivider(width: width),
        SelectableText(
          value ?? "",
          style: TextStyle(
            fontSize: labelSize,
            fontWeight: FontWeight.w500,
            color: priceColor ? AppColors.kPrimaryColor : null,
          ),
        ),
        if (child != null) child!
      ],
    );
  }
}
