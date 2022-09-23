import 'package:flutter/material.dart';
import 'package:recipe_app/models/explore_recipe.dart';
import 'package:recipe_app/utils/myOwnTheme.dart';

class Card1 extends StatelessWidget {
  const Card1({Key? key, required this.recipe}) : super(key: key);
  // 1
  final ExploreRecipe recipe;
  // 2
  @override
  Widget build(BuildContext context) {
    // 3
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(width: 320, height: 450),
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage(recipe.backgroundImage),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Stack(
          children: [
            Text(
              recipe.authorName,
              style: MyOwnTheme.darkTextTheme.bodyText1,
            ),
            Positioned(
              top: 20,
              child: Text(
                recipe.title
                ,
                style: MyOwnTheme.darkTextTheme.headline5,
              ),
            ),
            Positioned(
              bottom: 30,
              right: 0,
              child: Text(
                recipe.description,
                style: MyOwnTheme.darkTextTheme.bodyText1,
              ),
            ),
            Positioned(
              bottom: 10,
              right: 0,
              child: Text(
                recipe.authorName,
                style: MyOwnTheme.darkTextTheme.headline5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
