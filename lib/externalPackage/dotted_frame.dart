import 'package:flutter/material.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:dotted_border/dotted_border.dart';

class DottedFrame extends StatelessWidget {
  final Widget child;
  const DottedFrame({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      dashPattern: const [8, 4],
      strokeWidth: 2,
      borderType: BorderType.Circle,
      radius: PageItemSize.fullRadius(),
      color: Theme.of(context).colorScheme.onPrimary,
      padding: const EdgeInsets.all(5),
      child: child,
    );
  }
}
