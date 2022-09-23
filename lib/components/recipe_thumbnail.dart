import 'package:flutter/material.dart';
import 'package:recipe_app/utils/myOwnTheme.dart';
import '../models/simple_recipe.dart';

class RecipeThumbnail extends StatelessWidget {
  final SimpleRecipe simpleRecipe;
  const RecipeThumbnail({Key? key, required this.simpleRecipe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(simpleRecipe.dishImage,fit: BoxFit.cover,),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              simpleRecipe.title,
              style: MyOwnTheme.lightTextTheme.headline5,
            ),
            Text(
              '${simpleRecipe.duration} mins',
              style: MyOwnTheme.lightTextTheme.headline5,
            )
          ],
        ),
      ),
    );
  }
}
