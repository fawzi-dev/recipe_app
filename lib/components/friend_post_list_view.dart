import 'package:flutter/material.dart';
import 'package:recipe_app/components/friend_post_list_tile.dart';
import 'package:recipe_app/utils/myOwnTheme.dart';

import '../models/post.dart';

class FriendPostListView extends StatelessWidget {
  final List<Post> posts;
  const FriendPostListView({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Social Chefs 👨‍🍳',
            style: MyOwnTheme.lightTextTheme.headline1,
          ),
          const SizedBox(
            height: 16.0,
          ),
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              primary: false,
              itemBuilder: ((context, index) => FriendPostListTile(
                    post: posts[index],
                  )),
              separatorBuilder: ((context, index) => const Divider()),
              itemCount: posts.length)
        ],
      ),
    );
  }
}
