import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class EmptyPlaceholder extends StatelessWidget {
  final String message;

  const EmptyPlaceholder({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Opacity(
              opacity: 0.5,
              child: SvgPicture.asset(
                'assets/images/empty_placeholder.svg',
                height: 250,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            message,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
