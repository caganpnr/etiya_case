import 'package:etiya_case/product/theme/product_colors.dart';
import 'package:flutter/material.dart';

// customizing the ThemeData
final class ProductTheme {
  /// Default theme
  final ThemeData theme = ThemeData.dark().copyWith(
    typography: Typography.material2021(),
    scaffoldBackgroundColor: ProductColors.black,
    focusColor: ProductColors.red,
    disabledColor: ProductColors.grey,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: ProductColors.tranparent,
    ),
  );
}
