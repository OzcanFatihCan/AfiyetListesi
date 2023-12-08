import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class TextAnimated extends StatelessWidget {
  const TextAnimated({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    const fontSize = 40.0;
    const duration = 200;

    return AnimatedTextKit(
      isRepeatingAnimation: true,
      animatedTexts: [
        WavyAnimatedText(
          speed: const Duration(milliseconds: duration),
          text,
          textStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
