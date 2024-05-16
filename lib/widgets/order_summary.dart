import 'package:flutter/material.dart';

class OrderSummaryLine {
  final String title;
  final Widget? value;
  final String? textValue;

  OrderSummaryLine({
    required this.title,
    this.value,
    this.textValue,
  }) : assert(value != null || textValue != null);
}

class OrderSummary extends StatelessWidget {
  final String confirmationButtonText;
  final bool showConfirmationButton;
  final List<OrderSummaryLine> lines;
  final VoidCallback? onConfirmationButtonPressed;

  const OrderSummary({
    super.key,
    required this.confirmationButtonText,
    required this.showConfirmationButton,
    required this.lines,
    this.onConfirmationButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.only(top: 8)),
        Column(
          children: lines
              .map(
                (line) => ListTile(
                  title: Text(
                    line.title,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  trailing: line.value ??
                      Text(
                        line.textValue!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                ),
              )
              .toList(),
        ),
        Visibility(
          visible: showConfirmationButton,
          child: Center(
            child: TextButton(
              onPressed: onConfirmationButtonPressed,
              child: Text(confirmationButtonText),
            ),
          ),
        ),
      ],
    );
  }
}
