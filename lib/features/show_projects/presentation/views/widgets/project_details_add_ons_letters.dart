import 'package:flutter/material.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class ProjectDetailsAddOnsLetters extends StatelessWidget {
  final MainAxisAlignment? mainAxisAlignment;
  final Function()? otherAdditionsOnTap;
  final Function()? formsOnTap;
  final Function()? lettersOnTap;
  const ProjectDetailsAddOnsLetters({
    super.key,
    this.otherAdditionsOnTap,
    this.formsOnTap,
    this.lettersOnTap,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment == null
          ? MainAxisAlignment.spaceBetween
          : mainAxisAlignment!,
      children: [
        Visibility(
          visible: lettersOnTap != null,
          child: Column(
            children: [
              InkWell(
                onTap: lettersOnTap,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    "الصادر والوارد",
                    style: AppStyle.tabTextStyle.copyWith(
                      color: AppColors.kPrimaryColor,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: formsOnTap != null,
          child: InkWell(
            onTap: formsOnTap,
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "النماذج",
                style: AppStyle.tabTextStyle.copyWith(
                  color: AppColors.kPrimaryColor,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ),
        Visibility(
          visible: otherAdditionsOnTap != null,
          child: InkWell(
            onTap: otherAdditionsOnTap,
            child: Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "اضافات اخرى",
                style: AppStyle.tabTextStyle.copyWith(
                  color: AppColors.kPrimaryColor,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
