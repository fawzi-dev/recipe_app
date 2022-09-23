import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/models/app_state_manager.dart';

class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  'assets/fooderlich_assets/empty_list.png',
                ),
              ),
            ),
            const SizedBox(
              height: 28.0,
            ),
            const Text(
              'No Groceries!',
              style: TextStyle(
                  fontSize: 21.0,
                  color: Colors.black45,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              'Shopping for ingredients?\n '
              'Tap the + button and write them down',
              style: TextStyle(color: Colors.black45),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10.0,
            ),
            MaterialButton(
              onPressed: () {
                //TODO : Implement go to Recipe Tab code here
                Provider.of<AppStateManager>(context, listen: false)
                    .goToRecipes();
              },
              textColor: Colors.white,
              elevation: 0.2,
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              child: const Text('Browse Recipes'),
            )
          ],
        ),
      ),
    );
  }
}
