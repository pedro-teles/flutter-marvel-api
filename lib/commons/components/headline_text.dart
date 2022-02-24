import 'package:flutter/material.dart';

class HeadlineText extends StatelessWidget {
  const HeadlineText(this.text, {Key? key}) : super(key: key);

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
