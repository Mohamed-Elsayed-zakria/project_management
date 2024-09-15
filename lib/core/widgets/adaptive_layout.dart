import 'package:flutter/material.dart';

class AdaptiveLayout extends StatelessWidget {
  final WidgetBuilder smallView, largeView;
  const AdaptiveLayout({
    super.key,
    required this.smallView,
    required this.largeView,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        switch (constraints.maxWidth) {
          case >= 650:
            return largeView(context);
          default:
            return smallView(context);
        }
      },
    );
  }
}
