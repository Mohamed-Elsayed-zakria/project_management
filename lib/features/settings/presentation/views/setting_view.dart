import '/core/widgets/show_up_animation.dart';
import '/core/widgets/accordion_item.dart';
import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Colors.white,
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            AccordionItem(
              content: ShowUp(
                delay: 10,
                child: Text('data'),
              ),
              title: "معلومات الشركة",
            ),
          ],
        ),
      ),
    );
  }
}
