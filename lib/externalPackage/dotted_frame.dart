import 'package:afiyetlistesi/core/color_set.dart';
import 'package:afiyetlistesi/core/item_size.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

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
      color: PageColors.cardColor2,
      child: child,
      padding: EdgeInsets.all(5),
    );
  }
}
