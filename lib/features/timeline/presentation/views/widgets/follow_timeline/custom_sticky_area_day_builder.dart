import 'package:flutter/material.dart';

class CustomStickyAreaDayBuilder extends StatelessWidget {
  const CustomStickyAreaDayBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
      child: const Text(
        'اسم النشاط',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
