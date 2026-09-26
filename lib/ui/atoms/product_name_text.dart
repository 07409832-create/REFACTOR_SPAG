import 'package:flutter/material.dart';

/// Atom: renders a product's name on the catalog card.
class ProductNameText extends StatelessWidget {
  final String name;

  const ProductNameText(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }
}
