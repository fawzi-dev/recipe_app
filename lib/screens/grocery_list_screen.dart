import 'package:flutter/material.dart';
import 'package:recipe_app/components/grocery_tile.dart';
import 'package:recipe_app/models/grocery_manager.dart';
import 'package:recipe_app/screens/grocery_item_screen.dart';

class GroceryListScreen extends StatelessWidget {
  final GroceryManager groceryManager;

  const GroceryListScreen({Key? key, required this.groceryManager})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO 26: Replace with listview
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        itemCount: groceryManager.grocery.length,
        itemBuilder: ((context, index) {
          final item = groceryManager.grocery[index];

          return InkWell(
            onTap: () {
              groceryManager.groceryItemTapped(index);
            },
            child: Dismissible(
              background: Container(
                padding: const EdgeInsets.only(right: 12.0),
                alignment: Alignment.centerRight,
                color: Colors.red,
                child: const Icon(
                  Icons.delete_forever_rounded,
                  size: 38,
                  color: Colors.white,
                ),
              ),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                groceryManager.deleteItem(index);

                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('${item.name} dismissed')));
              },
              key: Key(item.id),
              child: GroceryTile(
                key: Key(item.id),
                item: item,
                onComplete: (change) {
                  if (change != null) {
                    groceryManager.completeItems(index, change);
                  }
                },
              ),
            ),
          );
        }),
        separatorBuilder: (context, index) => const SizedBox(height: 16.0),
      ),
    );
  }
}
