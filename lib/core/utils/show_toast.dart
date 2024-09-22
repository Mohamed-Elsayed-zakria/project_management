import 'package:toastification/toastification.dart';
import 'package:flutter/material.dart';

abstract class ShowToast {
  static void show({
    required BuildContext context,
    required String msg,
    bool? success,
  }) {
    toastification.show(
      context: context, // optional if you use ToastificationWrapper
      type: success == null
          ? ToastificationType.error
          : ToastificationType.success,
      style: ToastificationStyle.flat,
      autoCloseDuration: const Duration(seconds: 3),
      title: Text(success == null ? 'Error' : "Success"),
      description: RichText(
        text: TextSpan(
          text: msg,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      alignment: Alignment.bottomCenter,
      direction: TextDirection.ltr,
      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      icon: success == null
          ? const Icon(Icons.error_outline)
          : const Icon(Icons.check),
      showIcon: true,
      primaryColor: success == null ? Colors.red : Colors.green,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.black12),
      boxShadow: const [
        BoxShadow(
          color: Colors.white,
        )
      ],
      showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: false,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: true,
    );
  }
}
