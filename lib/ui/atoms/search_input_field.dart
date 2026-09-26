import 'package:flutter/material.dart';

/// Atom: the bare search text field. Holds no state of its own —
/// every keystroke is reported upward via [onChanged].
class SearchInputField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchInputField({
    super.key,
    required this.onChanged,
    this.hintText = 'Type a product name...',
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(hintText: hintText),
    );
  }
}
