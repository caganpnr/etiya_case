part of '../view/agent_view.dart';

class AgentsFailureWidget extends StatelessWidget {
  const AgentsFailureWidget({
    required this.failure,
    required this.onPressed,
    super.key,
  });

  final Failure failure;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error,
          size: context.highValue,
          color: context.theme.focusColor,
        ),
        SizedBox(
          height: context.mediumValue,
        ),
        CustomErrorText(
          failure: failure,
        ),
        SizedBox(
          height: context.mediumValue,
        ),
        RetryButton(
          onPressed: onPressed,
        ),
      ],
    );
  }
}
