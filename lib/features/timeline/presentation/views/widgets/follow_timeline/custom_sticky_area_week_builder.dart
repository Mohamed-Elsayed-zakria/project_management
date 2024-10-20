import 'package:flutter/material.dart';

class CustomStickyAreaWeekBuilder extends StatelessWidget {
  final bool visible;
  const CustomStickyAreaWeekBuilder({
    super.key,
    required this.visible,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Colors.black,
          ),
          top: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
      child: Visibility(
        visible: visible,
        child: const Text(
          'اسم النشاط',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
