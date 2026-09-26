import 'package:flutter/material.dart';

/// Atom: a bold section heading ("Search Products", "Catalog", etc.).
/// StatelessWidget, no logic beyond rendering the text it's given.
class SectionHeaderText extends StatelessWidget {
  final String text;

  const SectionHeaderText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
}
