import 'package:flutter/material.dart';

enum Importance { low, medium, high }

class GroceryItem {
  // Attrbiutes
  final String id;
  final String name;
  final Importance importance;
  final Color color;
  final int quantity;
  final DateTime dateTime;
  final bool isComplete;

  // Class constrcutor with parameter
  GroceryItem(
      {required this.id,
      required this.name,
      required this.importance,
      required this.color,
      required this.quantity,
      required this.dateTime,
      this.isComplete = false});

  // Creates and copies a completely new instance
  GroceryItem copyWith(
      {String? id,
      String? name,
      Importance? importance,
      Color? color,
      int? quantity,
      DateTime? dateTime,
      bool? isComplete}) {
    return GroceryItem(
      id: id ?? this.id,
      name: name ?? this.name,
      importance: importance ?? this.importance,
      color: color ?? this.color,
      quantity: quantity ?? this.quantity,
      dateTime: dateTime ?? this.dateTime,
      isComplete: isComplete ?? this.isComplete,
    );
  }
}
