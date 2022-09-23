import 'package:flutter/material.dart';
import 'package:recipe_app/api/mock_fooderlich_service.dart';
import 'package:recipe_app/components/components.dart';

import '../models/explore_data.dart';

class ExploreScreen extends StatefulWidget {
  ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final mockService = MockFooderlichService();

  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_scroller);
  }

  _scroller() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        _controller.position.outOfRange) {
      print('Reached the bottom');
    } else if (_controller.offset <= _controller.position.minScrollExtent &&
        _controller.position.outOfRange) {
      print('Reached the top');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: mockService.getExploreData(),
        builder: ((context, AsyncSnapshot<ExploreData> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // final recipe = ;
            return ListView(
              controller: _controller,
              physics: const BouncingScrollPhysics(),
              children: [
                TodayRecipeListView(
                  recipes: snapshot.data?.todayRecipes ?? [],
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 15),
                    child: FriendPostListView(
                        posts: snapshot.data?.friendPosts ?? []),
                  ),
                )
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        }),
      ),
    );
  }
}
