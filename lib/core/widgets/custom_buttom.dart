import '/core/utils/responsive_element_size.dart';
import 'package:flutter/material.dart';
import '/core/utils/size_screen.dart';
import '/core/constant/colors.dart';
import '/core/constant/style.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final bool isLoading;
  final String text;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = SizeScreen.size(context: context);
    return Container(
      height: 50,
      width: responsiveElementSize(size),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        onPressed: !isLoading ? onPressed : null,
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          backgroundColor: const WidgetStatePropertyAll(
            AppColors.kPrimaryColor,
          ),
        ),
        child: Visibility(
          visible: isLoading,
          replacement: Text(
            text,
            style: AppStyle.kTextStyle18.copyWith(
              color: AppColors.kSurfaceColor,
            ),
          ),
          child: const SizedBox(
            width: 25.5,
            height: 25.5,
            child: CircularProgressIndicator(
              color: AppColors.kSurfaceColor,
              strokeWidth: 3,
            ),
          ),
        ),
      ),
    );
  }
}
