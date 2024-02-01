import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class ToastService with _ToastSize {
  static void showToast({
    required IconData icon,
    required String message,
    required BuildContext context,
  }) {
    showToastWidget(
      Container(
        padding: _ToastSize.toastPadding,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: _ToastSize.toastRadius,
        ),
        margin: _ToastSize.toastMargin,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(color: Theme.of(context).colorScheme.secondary, icon),
            Padding(
              padding: _ToastSize.toastTextPadding,
              child: Text(
                message,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              ),
            ),
          ],
        ),
      ),
      context: context,
      animation: StyledToastAnimation.slideFromTopFade,
      reverseAnimation: StyledToastAnimation.slideFromTopFade,
      position: StyledToastPosition.top,
      animDuration: _ToastSize.toastAnimDuration,
      duration: _ToastSize.toastDuration,
      curve: Curves.easeInOut,
      reverseCurve: Curves.fastOutSlowIn,
    );
  }
}

mixin _ToastSize {
  static BorderRadius toastRadius = BorderRadius.circular(30.0);

  static EdgeInsets toastPadding =
      const EdgeInsets.symmetric(horizontal: 24.0, vertical: 6.0);
  static EdgeInsets toastMargin = const EdgeInsets.symmetric(horizontal: 50);
  static EdgeInsets toastTextPadding =
      const EdgeInsets.symmetric(horizontal: 10);

  static Duration toastAnimDuration = const Duration(milliseconds: 300);
  static Duration toastDuration = const Duration(seconds: 3);
}
