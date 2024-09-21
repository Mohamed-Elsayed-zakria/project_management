import '/core/utils/responsive_element_size.dart';
import 'package:flutter/material.dart';
import '/core/utils/size_screen.dart';

class CustomFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final int? maxLines;
  final int? maxLength;

  const CustomFormField({
    super.key,
    required this.label,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.validator,
    this.controller,
    this.obscureText = false,
    this.maxLines = 1,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = SizeScreen.size(context: context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: responsiveElementSize(size),
      child: TextFormField(
        maxLines: maxLines,
        maxLength: maxLength,
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          label: Text(label),
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
