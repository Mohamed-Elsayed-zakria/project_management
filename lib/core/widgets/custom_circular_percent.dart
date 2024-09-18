import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:flutter/material.dart';

class CustomCircularPercent extends StatelessWidget {
  final double percent;
  final Color progressColor;
  const CustomCircularPercent({
    super.key,
    required this.percent,
    required this.progressColor,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 50,
      center: Text(
        '${(percent * 100).toStringAsFixed(1)} %',
        style: const TextStyle(fontSize: 16),
      ),
      progressColor: progressColor,
      backgroundColor: progressColor.withOpacity(.25),
      lineWidth: 10,
      percent: percent,
      animation: true,
      animateFromLastPercent: true,
      animationDuration: 250,
    );
  }
}
