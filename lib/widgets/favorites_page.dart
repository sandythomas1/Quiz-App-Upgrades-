import 'package:flutter/material.dart';
import 'package:shopping_app/models/grocery_item.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({
    super.key,
    required this.groceryItems,
    required this.onToggleFavorite,
    required this.onRemoveItem,
  });

  final List<GroceryItem> groceryItems;
  final void Function(GroceryItem) onToggleFavorite;
  final void Function(GroceryItem) onRemoveItem;

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final favoriteItems = widget.groceryItems.where((item) => item.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Items'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: favoriteItems.isEmpty
          ? const Center(
              child: Text('No favorite items yet.'),
            )
          : ListView.builder(
              itemCount: favoriteItems.length,
              itemBuilder: (ctx, index) {
                final item = favoriteItems[index];
                return Dismissible(
                  key: ValueKey(item.id),
                  onDismissed: (direction) {
                    widget.onRemoveItem(item);
                    setState(() {});
                  },
                  child: ListTile(
                    title: Text(item.name),
                    leading: Container(
                      width: 24,
                      height: 24,
                      color: item.category.color,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          item.quantity.toString(),
                        ),
                        IconButton(
                          icon: Icon(
                            item.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: item.isFavorite ? Colors.red : null,
                          ),
                          onPressed: () {
                            widget.onToggleFavorite(item);
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

