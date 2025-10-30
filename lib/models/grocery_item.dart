import 'package:shopping_app/models/category.dart';

class GroceryItem {
  const GroceryItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
    this.isFavorite = false,
  });

  final String id;
  final String name;
  final int quantity;
  final Category category;
  final bool isFavorite;

  GroceryItem copyWith({
    String? id,
    String? name,
    int? quantity,
    Category? category,
    bool? isFavorite,
  }) {
    return GroceryItem(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      category: category ?? this.category,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}