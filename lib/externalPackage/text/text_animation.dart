import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class TextAnimated extends StatelessWidget {
  const TextAnimated({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    const fontSize = 25.0;
    const duration = 180;
    return AnimatedTextKit(
      repeatForever: true,
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
