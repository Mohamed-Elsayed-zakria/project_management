import '/core/widgets/accordion_item.dart';
import 'package:flutter/material.dart';
import 'incoming_letters_content.dart';
import 'outgoing_letters_content.dart';

class IncomingOutgoingLettersViewBody extends StatelessWidget {
  const IncomingOutgoingLettersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          AccordionItem(
            title: "الخطابات الواردة",
            content: IncomingLettersContent(),
          ),
          AccordionItem(
            title: "الخطابات الصادرة",
            content: OutgoingLettersContent(),
          ),
        ],
      ),
    );
  }
}
