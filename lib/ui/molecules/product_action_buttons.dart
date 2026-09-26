import 'package:flutter/material.dart';
import '../atoms/primary_button.dart';
import '../atoms/delete_icon_button.dart';

/// Molecule: the "Add to Cart" button stacked above the delete icon
/// on a product card. It only forwards taps upward — no business logic.
class ProductActionButtons extends StatelessWidget {
  final VoidCallback onAddToCart;
  final VoidCallback onDelete;

  const ProductActionButtons({
    super.key,
    required this.onAddToCart,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryButton(label: 'Add to Cart', onPressed: onAddToCart),
        const SizedBox(height: 6),
        DeleteIconButton(onPressed: onDelete),
      ],
    );
  }
}
