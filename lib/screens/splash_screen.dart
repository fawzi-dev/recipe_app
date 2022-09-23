import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/main.dart';
import 'package:recipe_app/models/fooderlich_pages.dart';
import 'package:recipe_app/models/models.dart';

class SplashScreen extends StatefulWidget {
  // TODO: SplashScreen MaterialPage Helper

  static MaterialPage page() {
    return MaterialPage(
      name: FooderlichPages.splashPath,
      key: ValueKey(FooderlichPages.splashPath),
      child: const SplashScreen(),
    );
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // TODO: Initialize App
    Provider.of<AppStateManager>(context, listen: false).intializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              height: 200,
              image: AssetImage('assets/fooderlich_assets/rw_logo.png'),
            ),
            Text('Initializing...'),
          ],
        ),
      ),
    );
  }
}
