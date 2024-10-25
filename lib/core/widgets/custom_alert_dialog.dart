import 'package:flutter/material.dart';
import '/core/constant/style.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final Widget content;
  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: AppStyle.kTextStyle20,
      ),
      contentPadding: const EdgeInsets.all(14),
      content: Container(
        constraints: const BoxConstraints(maxWidth: 360),
        child: content,
      ),
    );
  }
}
