import 'package:flutter/material.dart';

class TextInstructions extends StatelessWidget {
  final String text;

  const TextInstructions({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleLarge,
      textAlign: TextAlign.center,
    );
  }
}
