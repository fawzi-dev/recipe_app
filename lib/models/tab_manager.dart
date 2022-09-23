import 'package:flutter/material.dart';

class TabManager extends ChangeNotifier {
  // Keep track of seleced tab index
  int selectedTab = 0;

  // Goes to specific tab at index
  void goToTab(int value) {
    selectedTab = value;
    notifyListeners();
  }

  // Goes to recipe tab at index 1
  void goToRecipe() {
    selectedTab = 1;
    notifyListeners();
  }
}
