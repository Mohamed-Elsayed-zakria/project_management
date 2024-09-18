import '/core/widgets/accordion/accordion_type.dart';
import 'package:flutter/material.dart';
import 'accordion_items.dart';
import 'accordion_item.dart';

class CustomAccordionList extends StatefulWidget {
  final List<AccordionItems> children;
  final AccordionType? accordionType;
  final String? rightContent;
  final String? liftContent;
  final Color? liftColor;
  final Color? rightColor;
  const CustomAccordionList({
    super.key,
    required this.children,
    this.rightContent,
    this.liftContent,
    this.liftColor,
    this.rightColor,
    this.accordionType,
  });

  @override
  State<CustomAccordionList> createState() => _CustomAccordionListState();
}

class _CustomAccordionListState extends State<CustomAccordionList> {
  int? openIndex;

  @override
  Widget build(BuildContext context) {
    return widget.accordionType == AccordionType.listView ||
            widget.accordionType == null
        ? ListView.builder(
            itemCount: widget.children.length,
            itemBuilder: (context, index) => _buildAccordionItem(index),
          )
        : SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildAccordionItem(index),
              childCount: widget.children.length,
            ),
          );
  }

  Widget _buildAccordionItem(int index) {
    return AccordionItem(
      title: widget.children[index].title,
      content: widget.children[index].content,
      isOpen: openIndex == index,
      onPressed: () {
        setState(() {
          if (openIndex == index) {
            openIndex = null; // close if clicked again
          } else {
            openIndex = index; // open the clicked item
          }
        });
      },
    );
  }
}
