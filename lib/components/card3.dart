import 'package:flutter/material.dart';
import 'package:recipe_app/utils/myOwnTheme.dart';

import '../models/explore_recipe.dart';

class Card3 extends StatelessWidget {
  const Card3({Key? key, this.recipe}) : super(key: key);

  final recipe;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img3.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
            ),
            // TODO 6: Add Container, Column, Icon and Text
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.book,
                    size: 40,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8.0),
                  Text('Recipe Trends',
                      style: MyOwnTheme.darkTextTheme.headline4),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Wrap(
                  spacing: 12.0,
                  children: [
                    Chip(
                      label: Text('Healthy',
                          style: MyOwnTheme.darkTextTheme.bodyText1),
                      backgroundColor: Colors.black.withOpacity(0.7),
                      onDeleted: () {
                        print('Deleted');
                      },
                    ),
                    Chip(
                      label: Text('Vegan',
                          style: MyOwnTheme.darkTextTheme.bodyText1),
                      backgroundColor: Colors.black.withOpacity(0.7),
                      onDeleted: () {
                        print('Deleted');
                      },
                    ),
                    Chip(
                      label: Text('Carrots',
                          style: MyOwnTheme.darkTextTheme.bodyText1),
                      backgroundColor: Colors.black.withOpacity(0.7),
                    ),
                    Chip(
                      label: Text('Green',
                          style: MyOwnTheme.darkTextTheme.bodyText1),
                      backgroundColor: Colors.black.withOpacity(0.7),
                    ),
                    Chip(
                      label: Text('Pescetarian',
                          style: MyOwnTheme.darkTextTheme.bodyText1),
                      backgroundColor: Colors.black.withOpacity(0.7),
                    ),
                    Chip(
                      label: Text('Mint',
                          style: MyOwnTheme.darkTextTheme.bodyText1),
                      backgroundColor: Colors.black.withOpacity(0.7),
                    ),
                    Chip(
                      label: Text('Wheat',
                          style: MyOwnTheme.darkTextTheme.bodyText1),
                      backgroundColor: Colors.black.withOpacity(0.7),
                    ),
                    Chip(
                      label: Text('Lemongrass',
                          style: MyOwnTheme.darkTextTheme.bodyText1),
                      backgroundColor: Colors.black.withOpacity(0.7),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
