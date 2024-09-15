import 'package:flutter/material.dart';

class FormDivider extends StatelessWidget {
  final double? width;
  const FormDivider({
    super.key,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 70,
      height: 2,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            Colors.grey.shade600,
            Colors.white,
          ],
        ),
      ),
    );
  }
}
