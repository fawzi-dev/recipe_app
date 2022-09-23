import 'package:flutter/material.dart';
import 'package:recipe_app/api/mock_fooderlich_service.dart';
import 'package:recipe_app/components/components.dart';
import 'package:recipe_app/components/recipe_thumbnail.dart';

import '../models/simple_recipe.dart';

class RecipeScreen extends StatelessWidget {
  final exploreService = MockFooderlichService();
  RecipeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: exploreService.getRecipes(),
      builder: ((context, AsyncSnapshot<List<SimpleRecipe>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Center(
            child: RecipeGridView(recipes: snapshot.data ?? []),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
