import '/core/widgets/accordion_item.dart';
import 'package:flutter/material.dart';

class IncomingOutgoingLettersViewBody extends StatelessWidget {
  const IncomingOutgoingLettersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          AccordionItem(
            title: "الخطابات الصادرة",
            content: Text("الخطابات الصادرة"),
          ),
          AccordionItem(
            title: "الخطابات الواردة",
            content: Text("الخطابات الواردة"),
          ),
        ],
      ),
    );
  }
}
