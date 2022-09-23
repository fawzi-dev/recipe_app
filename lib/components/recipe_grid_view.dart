import 'package:flutter/cupertino.dart';
import 'package:recipe_app/components/recipe_thumbnail.dart';
import 'package:recipe_app/models/models.dart';

class RecipeGridView extends StatelessWidget {
  final List<SimpleRecipe> recipes;
  const RecipeGridView({Key? key, required this.recipes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: recipes.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 500),
        itemBuilder: (context, index) =>
            RecipeThumbnail(simpleRecipe: recipes[index]),
      ),
    );
  }
}
