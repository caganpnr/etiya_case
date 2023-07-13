import 'package:etiya_case/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class ValorantText extends StatelessWidget {
  /// Displays text such as `Agents` , `Abilities` with Valorant font
  const ValorantText({required this.text, required this.isTitle, super.key});

  final String text;
  final bool isTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Valorant',
        fontSize: isTitle ? context.textTheme.titleLarge?.fontSize : context.textTheme.titleMedium?.fontSize,
      ),
    );
  }
}
