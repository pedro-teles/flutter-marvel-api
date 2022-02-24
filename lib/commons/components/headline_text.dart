import 'package:flutter/material.dart';

class HeadlineText extends StatelessWidget {
  HeadlineText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
