import '/core/utils/responsive_element_size.dart';
import 'package:flutter/material.dart';
import '/core/utils/size_screen.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class CustomListTileValidator extends StatelessWidget {
  final Function() onTap;
  final String title;
  final Icon? leading;
  final bool validator;
  final String errorMessage;

  const CustomListTileValidator({
    super.key,
    required this.onTap,
    required this.title,
    this.leading,
    this.validator = true,
    this.errorMessage = 'مطلوب',
  });

  @override
  Widget build(BuildContext context) {
    final Size size = SizeScreen.size(context: context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: responsiveElementSize(size),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: validator
                    ? AppColors.kOnSurfaceVariantColor
                    : AppColors.kErrorColor,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: ListTile(
              onTap: onTap,
              title: Text(
                title,
                style: TextStyle(
                  color: validator
                      ? AppColors.kOnSurfaceColor
                      : AppColors.kErrorColor,
                ),
              ),
              leading: leading,
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            ),
          ),
          Visibility(
            visible: validator != true,
            child: Container(
              margin: const EdgeInsets.only(right: 14, left: 14, top: 6),
              child: Text(
                errorMessage,
                style: AppStyle.kTextStyle12.copyWith(
                  color: AppColors.kErrorColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
