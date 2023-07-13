import 'package:etiya_case/core/extensions/context_extensions.dart';
import 'package:etiya_case/product/failure/failure.dart';
import 'package:flutter/material.dart';

class CustomErrorText extends StatelessWidget {
  /// Takes a [Failure] object and returns a error text accordingly
  const CustomErrorText({required this.failure, super.key});

  final Failure failure;

  @override
  Widget build(BuildContext context) {
    return Text(
      switch (failure) {
        DioFailure() => 'Network Error',
        UnknownFailure() => 'Unknown Failure',
        NullResponseFailure() => 'Cannot Fetch Data',
      },
      style: context.textTheme.titleMedium,
    );
  }
}
