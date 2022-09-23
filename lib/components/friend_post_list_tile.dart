import 'package:flutter/cupertino.dart';
import 'package:recipe_app/components/circle_image.dart';
import '../models/models.dart';

class FriendPostListTile extends StatelessWidget {
  final Post post;

  const FriendPostListTile({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleImage(
          imageProvider: AssetImage(post.profileImageUrl),
        ),
        const SizedBox(
          width: 16.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(post.comment),
              Text(
                '${post.timestamp} mins ago',
                style: const TextStyle(fontWeight: FontWeight.w700),
              )
            ],
          ),
        )
      ],
    );
  }
}
