import 'package:flutter/material.dart';
import 'package:recipe_app/models/grocery_item.dart';

class GroceryManager extends ChangeNotifier {
  final List<GroceryItem> _groceryItem = [];
  int _selectedIndex = -1;
  bool _createNewItem = false;

  List<GroceryItem> get grocery => List.unmodifiable(_groceryItem);
  int get selectedIndex => _selectedIndex;
  GroceryItem? get selectedGroceryItem =>
      _selectedIndex != -1 ? _groceryItem[_selectedIndex] : null;
  bool get isCreatingNewItem => _createNewItem;

  // Checks whether user wants to create new item
  void createNewItem() {
    _createNewItem = true;
    notifyListeners();
  }

  // The tapped grocery item index
  void groceryItemTapped(int index) {
    _selectedIndex = index;
    _createNewItem = false;
    notifyListeners();
  }

  // Add a new GroceryItem to the list
  void addItem(GroceryItem groceryItem) {
    _groceryItem.add(groceryItem);
    _createNewItem = false;
    notifyListeners();
  }

  // Update the existing GroceryItem in the list
  void updateItem(GroceryItem groceryItem, int index) {
    _groceryItem[index] = groceryItem;
    _selectedIndex = -1;
    _createNewItem = false;
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
