import 'dart:async';
import 'package:flutter/material.dart';

class ShowUp extends StatefulWidget {
  final Widget child;
  final int? delay;

  const ShowUp({
    super.key,
    required this.child,
    this.delay,
  });

  @override
  State<ShowUp> createState() => _ShowUpState();
}

class _ShowUpState extends State<ShowUp> with TickerProviderStateMixin {
  AnimationController? _animController;
  Animation<Offset>? _animOffset;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController!);
    _animOffset =
        Tween<Offset>(begin: const Offset(0.0, 0.35), end: Offset.zero)
            .animate(curve);

    if (widget.delay == null) {
      if (mounted) {
        _animController?.forward();
      }
    } else {
      if (widget.delay != null) {
        _timer = Timer(Duration(milliseconds: widget.delay!), () {
          if (mounted) {
            _animController?.forward();
          }
        });
      }
    }
  }

  @override
  void dispose() {
    _animController?.dispose();
    if (_timer != null) _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animController!,
      child: SlideTransition(
        position: _animOffset!,
        child: widget.child,
      ),
    );
  }
}
