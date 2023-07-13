import 'package:etiya_case/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class RetryButton extends StatelessWidget {
  /// Use this in case of a failure
  const RetryButton({required this.onPressed, super.key});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: context.theme.focusColor,
        shape: RoundedRectangleBorder(
          borderRadius: context.defaultBorderRadius,
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.refresh),
          SizedBox(
            width: context.lowValue,
          ),
          const Text('Retry'),
        ],
      ),
    );
  }
}
