import 'package:flutter/material.dart';
import 'package:recipe_app/utils/myOwnTheme.dart';

import 'circle_image.dart';

class AuthorCard extends StatefulWidget {
  // 1
  final String authorName;
  final String title;
  final ImageProvider? imageProvider;
  const AuthorCard({
    Key? key,
    required this.authorName,
    required this.title,
    this.imageProvider,
  }) : super(key: key);

  @override
  State<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  // Handles fav icon state
  bool _isFav = false;
  // 2
  @override
  Widget build(BuildContext context) {
    // TODO: Replace return Container(...);
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleImage(
            imageProvider: widget.imageProvider,
            imageRadius: 30,
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.authorName,
                style: MyOwnTheme.lightTextTheme.headline3,
              ),
              Text(
                widget.title,
                style: MyOwnTheme.lightTextTheme.bodyText1,
              )
            ],
          ),
          Expanded(child: Container()),
          IconButton(
            onPressed: () {
              setState(() {
                _isFav = !_isFav;
              });
            },
            icon: Icon(_isFav != true ? Icons.favorite_border : Icons.favorite),
            iconSize: 30,
            color: _isFav != true ? Colors.grey[400] : Colors.red[400],
          ),
        ],
      ),
    );
  }
}
