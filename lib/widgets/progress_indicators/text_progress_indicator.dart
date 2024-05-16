import 'package:flutter/material.dart';

class TextProgressIndicator extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;

  const TextProgressIndicator(
    this.text, {
    super.key,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox.square(
          dimension: 12,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
        const Padding(padding: EdgeInsets.only(left: 12)),
        Text(
          text,
          style: textStyle,
        ),
      ],
    );
  }
}
