import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class AccordionItem extends StatefulWidget {
  final Widget content;
  final String title;
  final String? rightContent;
  final String? liftContent;
  final Color? liftColor;
  final Color? rightColor;

  const AccordionItem({
    super.key,
    required this.content,
    required this.title,
    this.rightContent,
    this.liftContent,
    this.liftColor,
    this.rightColor,
  });

  @override
  State<AccordionItem> createState() => _AccordionItemState();
}

class _AccordionItemState extends State<AccordionItem> {
  bool state = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.teal),
      ),
      child: Column(
        children: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              setState(() {
                state = !state;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      widget.rightContent ?? '',
                      style: AppStyle.kTextStyle16.copyWith(
                        color: widget.rightColor ?? AppColors.kPrimaryColor,
                      ),
                    ),
                  ),
                  Text(
                    widget.title,
                    style: AppStyle.tabTextStyle,
                  ),
                  widget.liftContent != null
                      ? Text(
                          widget.liftContent!,
                          style: AppStyle.kTextStyle16.copyWith(
                            color: widget.liftColor ?? AppColors.kPrimaryColor,
                          ),
                        )
                      : state
                          ? const Icon(
                              Icons.arrow_drop_up,
                              color: AppColors.kPrimaryColor,
                            )
                          : const Icon(
                              Icons.arrow_drop_down,
                              color: AppColors.kPrimaryColor,
                            ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: state,
            child: Column(
              children: [
                const Divider(
                  color: AppColors.kPrimaryColor,
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: widget.content,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
