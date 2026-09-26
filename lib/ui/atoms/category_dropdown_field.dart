import 'package:flutter/material.dart';

/// Atom: a dropdown for picking a product category. It renders the
/// options it is given and reports the choice upward — it does not
/// decide what the categories are or what happens after a change.
class CategoryDropdownField extends StatelessWidget {
  final String value;
  final List<String> categories;
  final ValueChanged<String?> onChanged;
  final String labelText;

  const CategoryDropdownField({
    super.key,
    required this.value,
    required this.categories,
    required this.onChanged,
    this.labelText = 'Category',
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      decoration: InputDecoration(labelText: labelText),
      items: categories
          .map((cat) => DropdownMenuItem(value: cat, child: Text(cat)))
          .toList(),
      onChanged: onChanged,
    );
  }
}
