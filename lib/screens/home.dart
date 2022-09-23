import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/screens/screens.dart';

import '../models/fooderlich_pages.dart';
import '../models/models.dart';

class Home extends StatefulWidget {
  // TODO: Home MaterialPage Helper
  static MaterialPage page(int currentTab) {
    return MaterialPage(
      name: FooderlichPages.home,
      key: ValueKey(FooderlichPages.home),
      child: Home(
        currentTab: currentTab,
      ),
    );
  }

  const Home({
    Key? key,
    required this.currentTab,
  }) : super(key: key);

  final int currentTab;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static List<Widget> pages = <Widget>[
    ExploreScreen(),
    RecipeScreen(),
    const GroceryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: Wrap Consumer for AppStateManager
    return Consumer<AppStateManager>(
      builder: (context, appStateManager, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Fooderlich',
            style: Theme.of(context).textTheme.headline6,
          ),
          actions: [
            profileButton(),
          ],
        ),
        body: IndexedStack(index: widget.currentTab, children: pages),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:
              Theme.of(context).textSelectionTheme.selectionColor,
          currentIndex: widget.currentTab,
          onTap: (index) {
            // TODO: Update user's selected tab
            Provider.of<AppStateManager>(context, listen: false).goToTab(index);
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Recipes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'To Buy',
            ),
          ],
        ),
      ),
    );
  }

  Widget profileButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        child: const CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(
            'assets/profile_pics/person_stef.jpeg',
          ),
        ),
        onTap: () {
          // TODO: home -> profile
        },
      ),
    );
  }
}
