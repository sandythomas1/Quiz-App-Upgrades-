import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/new_item.dart';
import 'package:shopping_app/widgets/favorites_page.dart';
import 'package:shopping_app/models/grocery_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shopping_app/data/categories.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];
  late Future<List<GroceryItem>> _loadedItems;
  //String? _error;

  @override
  void initState() {
    super.initState();
    _loadedItems = _loadItems();
  }

  Future<List<GroceryItem>> _loadItems() async {
    final url = Uri.https(
      'flutter-prep-ff198-default-rtdb.firebaseio.com',
      'shopping-list.json',
    );

    final response = await http.get(url);

    if (response.statusCode >= 400) {
      throw Exception('Failed to fetch data. Please try again later.');
    }

    if (response.body == 'null') {
      return [];
    }

    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItem> loadedItems = [];
    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere(
            (catItem) => catItem.value.title == item.value['category'],
          )
          .value;
      loadedItems.add(
        GroceryItem(
          id: item.key,
          name: item.value['name'],
          quantity: item.value['quantity'],
          category: category,
          isFavorite: item.value['isFavorite'] ?? false,
        ),
      );
    }
    return loadedItems;
  }

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );

    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) async {
    final index = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.remove(item);
    });

    final url = Uri.https(
      'flutter-prep-ff198-default-rtdb.firebaseio.com',
      'shopping-list/${item.id}.json',
    );

    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      setState(() {
        _groceryItems.insert(index, item);
      });
    }
  }

  void _toggleFavorite(GroceryItem item) async {
    final itemIndex = _groceryItems.indexWhere((i) => i.id == item.id);
    if (itemIndex == -1) return;

    final updatedItem = item.copyWith(isFavorite: !item.isFavorite);
    
    setState(() {
      _groceryItems[itemIndex] = updatedItem;
    });

    final url = Uri.https(
      'flutter-prep-ff198-default-rtdb.firebaseio.com',
      'shopping-list/${item.id}.json',
    );

    final response = await http.patch(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'isFavorite': updatedItem.isFavorite,
      }),
    );

    if (response.statusCode >= 400) {
      setState(() {
        _groceryItems[itemIndex] = item;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => FavoritesPage(
                    groceryItems: _groceryItems,
                    onToggleFavorite: _toggleFavorite,
                    onRemoveItem: _removeItem,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.favorite),
          ),
        ],
      ),

      body: FutureBuilder(
        future: _loadedItems,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          }

          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No items added yet.'),
            );
          }

          _groceryItems = snapshot.data!;

          return ListView.builder(
            itemCount: _groceryItems.length,
            itemBuilder: (ctx, index) => Dismissible(
              onDismissed: (direction) {
                _removeItem(_groceryItems[index]);
              },
              key: ValueKey(_groceryItems[index].id),
              child: ListTile(
                title: Text(_groceryItems[index].name),
                leading: Container(
                  width: 24,
                  height: 24,
                  color: _groceryItems[index].category.color,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _groceryItems[index].quantity.toString(),
                    ),
                    IconButton(
                      icon: Icon(
                        _groceryItems[index].isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: _groceryItems[index].isFavorite
                            ? Colors.red
                            : null,
                      ),
                      onPressed: () {
                        _toggleFavorite(_groceryItems[index]);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
