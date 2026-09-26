import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../atoms/product_icon_avatar.dart';
import '../molecules/product_info_column.dart';
import '../molecules/product_action_buttons.dart';

/// Organism: a single catalog card, composed from atoms and a
/// molecule. It renders the [product] it is given and reports taps
/// upward via callbacks — it never owns or mutates the master list.
class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onAddToCart;
  final VoidCallback onDelete;

  const ProductCard({
    super.key,
    required this.product,
    required this.onAddToCart,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ProductIconAvatar(icon: product.icon),
          const SizedBox(width: 12),
          Expanded(
            child: ProductInfoColumn(
              name: product.name,
              category: product.category,
              price: product.price,
            ),
          ),
          ProductActionButtons(
            onAddToCart: onAddToCart,
            onDelete: onDelete,
          ),
        ],
      ),
    );
  }
}
