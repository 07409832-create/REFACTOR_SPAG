import 'package:flutter/material.dart';

/// Atom: the app's single reusable filled button. Both the inline
/// "Add to Cart" button and the full-width "Submit Product" button
/// are just different parameter sets on this one widget, instead of
/// two copy-pasted ElevatedButtons.
class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool fullWidth;
  final bool boldLabel;
  final EdgeInsetsGeometry? padding;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.fullWidth = false,
    this.boldLabel = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final button = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        padding: padding,
      ),
      child: Text(
        label,
        style: boldLabel
            ? const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )
            : null,
      ),
    );

    return fullWidth
        ? SizedBox(width: double.infinity, child: button)
        : button;
  }
}
