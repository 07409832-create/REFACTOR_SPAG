import 'package:flutter/material.dart';

/// Simple immutable data model for a catalog product.
///
/// This didn't exist in the original file (products were raw
/// `Map<String, dynamic>`). Introducing it doesn't change behavior —
/// it just gives Organisms/Pages a typed shape to pass around instead
/// of untyped maps, and is what lets the Template stay data-model-free
/// (it only ever sees Widgets, never a Product).
class Product {
  final int id;
  final String name;
  final double price;
  final String category;
  final IconData icon;
  final String description;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.icon,
    this.description = '',
  });
}
