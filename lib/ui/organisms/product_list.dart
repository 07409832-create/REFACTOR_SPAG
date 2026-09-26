import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../atoms/section_header_text.dart';
import 'product_card.dart';

/// Organism: renders the "Catalog" heading plus one [ProductCard] per
/// item in [products]. It only ever displays the list it's handed —
/// it never reaches into app-level data itself, so it doesn't own
/// the source of truth even though it does the mapping/iteration.
class ProductList extends StatelessWidget {
  final List<Product> products;
  final ValueChanged<Product> onAddToCart;
  final ValueChanged<Product> onDelete;

  const ProductList({
    super.key,
    required this.products,
    required this.onAddToCart,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeaderText('Catalog'),
        const SizedBox(height: 8),
        Column(
          children: products.map((product) {
            return ProductCard(
              product: product,
              onAddToCart: () => onAddToCart(product),
              onDelete: () => onDelete(product),
            );
          }).toList(),
        ),
      ],
    );
  }
}
