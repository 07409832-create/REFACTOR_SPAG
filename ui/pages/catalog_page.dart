import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../molecules/search_bar_section.dart';
import '../organisms/product_list.dart';
import '../organisms/add_product_form.dart';
import '../templates/catalog_template.dart';

/// Page: the only widget allowed to own the real product list. It
/// wires that live data down into the template's organisms/molecules
/// and handles every action that mutates state (search, add to cart,
/// delete, add product) plus the resulting confirmation feedback.
class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  final List<Product> _products = [
    const Product(
        id: 1,
        name: 'Wireless Mouse',
        price: 599.0,
        category: 'Electronics',
        icon: Icons.mouse),
    const Product(
        id: 2,
        name: 'Mechanical Keyboard',
        price: 2499.0,
        category: 'Electronics',
        icon: Icons.keyboard),
    const Product(
        id: 3,
        name: 'Ceramic Mug',
        price: 149.0,
        category: 'Home',
        icon: Icons.coffee),
    const Product(
        id: 4,
        name: 'Notebook',
        price: 79.0,
        category: 'Office',
        icon: Icons.book),
    const Product(
        id: 5,
        name: 'Desk Lamp',
        price: 899.0,
        category: 'Home',
        icon: Icons.lightbulb),
    const Product(
        id: 6,
        name: 'Backpack',
        price: 1299.0,
        category: 'Accessories',
        icon: Icons.backpack),
    const Product(
        id: 7,
        name: 'Water Bottle',
        price: 299.0,
        category: 'Accessories',
        icon: Icons.local_drink),
  ];

  String _searchQuery = '';
  int _nextId = 8;

  void _handleSearchChanged(String value) {
    setState(() {
      _searchQuery = value;
    });
  }

  void _handleAddToCart(Product product) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Added ${product.name} to cart')),
    );
  }

  void _handleDelete(Product product) {
    setState(() {
      _products.removeWhere((p) => p.id == product.id);
    });
  }

  void _handleAddProduct(
    String name,
    double price,
    String category,
    String description,
  ) {
    final newProduct = Product(
      id: _nextId,
      name: name,
      price: price,
      category: category,
      icon: Icons.inventory_2,
      description: description,
    );

    setState(() {
      _products.add(newProduct);
      _nextId += 1;
      _searchQuery = '';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${newProduct.name} added to catalog!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredProducts = _products
        .where((p) =>
            p.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return CatalogTemplate(
      appBarTitle: 'Messy Catalog',
      searchSlot: SearchBarSection(onChanged: _handleSearchChanged),
      catalogSlot: ProductList(
        products: filteredProducts,
        onAddToCart: _handleAddToCart,
        onDelete: _handleDelete,
      ),
      formSlot: AddProductForm(onSubmit: _handleAddProduct),
    );
  }
}
