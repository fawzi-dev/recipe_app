import 'package:flutter/material.dart';
import 'components.dart';
import 'package:recipe_app/models/explore_recipe.dart';
import '../utils/myOwnTheme.dart';

class TodayRecipeListView extends StatelessWidget {
  const TodayRecipeListView({Key? key, required this.recipes})
      : super(key: key);

  final List<ExploreRecipe> recipes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recipes of the day 🍳',
            style: MyOwnTheme.lightTextTheme.headline1,
          ),
          const SizedBox(
            height: 12.0,
          ),
          Container(
            height: 400,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                final recipe = recipes[index];
                return buildCard(recipe);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 15.0);
              },
            ),
          )
        ],
      ),
    );
  }
}

Widget buildCard(ExploreRecipe exploreRecipe) {
  if (exploreRecipe.cardType == RecipeCardType.card1) {
    return Card1(
      recipe: exploreRecipe,
    );
  } else if (exploreRecipe.cardType == RecipeCardType.card2) {
    return Card2(
      recipe: exploreRecipe,
    );
  } else if (exploreRecipe.cardType == RecipeCardType.card2) {
    return Card3(
      recipe: exploreRecipe,
    );
  } else {
    return Container();
  }
}
