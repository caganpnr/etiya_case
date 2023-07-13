import 'package:etiya_case/core/extensions/context_extensions.dart';
import 'package:etiya_case/product/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoadingAnimation extends StatelessWidget {
  /// Display a custom loading animation using [Lottie] package
  const CustomLoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.veryHighValue3x,
      child: LottieBuilder.asset(AssetConstants.loadingAnimation),
    );
  }
}
