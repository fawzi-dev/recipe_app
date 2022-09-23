import 'package:flutter/material.dart';
import 'package:recipe_app/models/grocery_item.dart';

class GroceryManager extends ChangeNotifier {
  final List<GroceryItem> _groceryItem = [
    // GroceryItem(
    //     id: 'id',
    //     name: 'Fawzi Gharib',
    //     importance: Importance.low,
    //     color: Colors.black,
    //     quantity: 1,
    //     dateTime: DateTime.now())
  ];

  List<GroceryItem> get grocery {
    return List.unmodifiable(_groceryItem);
  }

  // Add a new GroceryItem to the list
  void addItem(GroceryItem groceryItem) {
    _groceryItem.add(groceryItem);
    notifyListeners();
  }

  // Update the existing GroceryItem in the list
  void updateItem(GroceryItem groceryItem, int index) {
    _groceryItem[index] = groceryItem;
    notifyListeners();
  }

  // Delete a GroceryItem in the list
  void deleteItem(int index) {
    _groceryItem.removeAt(index);
    notifyListeners();
  }

  // Toggle completeness of an GroceryItem in the list
  void completeItems(int index, bool change) {
    final item = _groceryItem[index];
    _groceryItem[index] = item.copyWith(isComplete: change);
    notifyListeners();
  }
}
