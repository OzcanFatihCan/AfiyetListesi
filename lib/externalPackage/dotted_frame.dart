import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class DottedFrame extends StatelessWidget with _pageSize {
  final Widget child;
  DottedFrame({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      dashPattern: dashPattern,
      strokeWidth: strokeWidth,
      borderType: BorderType.Circle,
      radius: fullRadius,
      color: Theme.of(context).colorScheme.onPrimary,
      padding: dottedPadding,
      child: child,
    );
  }
}

mixin _pageSize {
  //obj
  final List<double> dashPattern = [8, 4];
  final double strokeWidth = 2;
  //radius
  final fullRadius = const Radius.circular(30);
  //padding
  final dottedPadding = const EdgeInsets.all(5);
}
