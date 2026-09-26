import 'package:flutter/material.dart';

/// Atom: the styled title text used in the catalog's AppBar.
class AppBarTitleText extends StatelessWidget {
  final String text;

  const AppBarTitleText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
