import 'package:flutter/material.dart';
import 'package:recipe_app/utils/myOwnTheme.dart';
import 'package:recipe_app/components/author_card.dart';

import '../models/explore_recipe.dart';


class Card2 extends StatelessWidget {
  const Card2({Key? key, required this.recipe}) : super(key: key);

  final ExploreRecipe recipe;
  @override
  Widget build(BuildContext context) {
    return Center(
      // 1
      child: Container(
        constraints: const BoxConstraints.expand(
          width: 320,
          height: 450,
        ),
        decoration:  BoxDecoration(
          image: DecorationImage(
            image: AssetImage(recipe.backgroundImage),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        // 2
        child: Column(
          children: [
             AuthorCard(
              authorName: recipe.authorName,
              title: 'Smoothie Connoisseur',
              imageProvider: AssetImage(recipe.profileImage),
            ),
            Expanded(
                child: Stack(
              children: [
                Positioned(
                  left: 16,
                  bottom: 30,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      'Smoothies',
                      style: MyOwnTheme.lightTextTheme.headline3,
                    ),
                  ),
                ),
                Positioned(
                  right: 7,
                  bottom: 7,
                  child: Text(
                    'Recipe',
                    style: MyOwnTheme.lightTextTheme.headline3,
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
