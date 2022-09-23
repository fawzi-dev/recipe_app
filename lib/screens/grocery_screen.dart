import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/models/grocery_manager.dart';
import 'package:recipe_app/screens/empty_grocery_screen.dart';
import 'package:recipe_app/screens/grocery_item_screen.dart';
import 'package:recipe_app/screens/grocery_list_screen.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          final manager = Provider.of<GroceryManager>(context, listen: false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => GroceryItemScreen(
                    onCreate: (item) {
                      manager.addItem(item);
                      Navigator.pop(context);
                    },
                    onUpdate: (item) {
                      
                    },
                  )),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: buildEmptyGroceryScreen(),
    );
  }

  buildEmptyGroceryScreen() {
    return Consumer<GroceryManager>(
      builder: ((context, groceryManager, child) {
        if (groceryManager.grocery.isNotEmpty) {
          return GroceryListScreen(groceryManager: groceryManager);
        } else {
          return const EmptyGroceryScreen();
        }
      }),
    );
  }
}
