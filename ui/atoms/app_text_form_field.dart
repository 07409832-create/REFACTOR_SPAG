import 'package:flutter/material.dart';

/// Atom: a labeled text form field used inside the Add Product form.
/// It owns no state and contains no validation rules of its own —
/// the caller supplies the controller and the validator function.
class AppTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType? keyboardType;
  final int maxLines;
  final bool alignLabelWithHint;
  final String? Function(String?)? validator;

  const AppTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.keyboardType,
    this.maxLines = 1,
    this.alignLabelWithHint = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        alignLabelWithHint: alignLabelWithHint,
      ),
      validator: validator,
    );
  }
}
