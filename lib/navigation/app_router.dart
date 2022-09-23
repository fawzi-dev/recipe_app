import 'package:flutter/cupertino.dart';
import 'package:recipe_app/models/fooderlich_pages.dart';
import 'package:recipe_app/models/grocery_manager.dart';
import 'package:recipe_app/models/models.dart';
import 'package:recipe_app/models/profile_manager.dart';
import 'package:recipe_app/screens/screens.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
      
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppStateManager appStateManager;

  final GroceryManager groceryManager;

  final ProfileManager profileManager;

  AppRouter(
      {required this.appStateManager,
      required this.groceryManager,
      required this.profileManager})
      : navigatorKey = GlobalKey<NavigatorState>() {
    appStateManager.addListener(notifyListeners);
    groceryManager.addListener(notifyListeners);
    profileManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    groceryManager.removeListener(notifyListeners);
    profileManager.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        // TODO: Add SplashScreen
        if (!appStateManager.isIntialized) SplashScreen.page(),
        // TODO: Add LoginScreen
        if (appStateManager.isIntialized && !appStateManager.isLoggedIn)
          LoginScreen.page(),
        // TODO: Add OnboardingScreen
        if (appStateManager.isLoggedIn && !appStateManager.isOnBoardingComplete)
          OnboardingScreen.page(),
        // TODO: Add Home
        if (appStateManager.isOnBoardingComplete)
          Home.page(appStateManager.getSelectedTab)
        // TODO: Create new item
        // TODO: Select GroceryItemScreen
        // TODO: Add Profile Screen
        // TODO: Add WebView Screen
      ],
    );
  }

  // TODO: Add _handlePopPage
  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    // 5
    // TODO: Handle Onboarding and splash
    if (route.settings.name == FooderlichPages.onboardingPath) {
      appStateManager.logout();
    }
    // TODO: Handle state when user closes grocery item screen
    // TODO: Handle state when user closes profile screen
    // TODO: Handle state when user closes WebView screen

    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
