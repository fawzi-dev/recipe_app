import 'dart:async';

import 'package:flutter/cupertino.dart';

class FooderlichTab {
  static const int explore = 0;
  static const int recipes = 1;
  static const int toBuy = 2;
}

class AppStateManager extends ChangeNotifier {
  // controls splash screen to be shown
  bool _intialized = false;
  // controls whether user is logged in or not
  bool _loggedIn = false;
  // controls whether on boarding is completed
  bool _onBoardingComplete = false;

  // selected tab
  int _selectedTab = FooderlichTab.explore;

  bool get isIntialized => _intialized;
  bool get isLoggedIn => _loggedIn;
  bool get isOnBoardingComplete => _onBoardingComplete;
  int get getSelectedTab => _selectedTab;

  // TODO: Add initializeApp
  // TODO: Add login
  // TODO: Add completeOnboarding
  // TODO: Add goToTab
  // TODO: Add goToRecipes
  // TODO: Add logout

  void intializeApp() {
    Timer(
      const Duration(milliseconds: 2000),
      () {
        _intialized = true;
        notifyListeners();
      },
    );
  }

  void login(String usrname, String password) {
    _loggedIn = true;
    notifyListeners();
  }

  void completeOnBoarding() {
    _onBoardingComplete = true;
    notifyListeners();
  }

  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

  void goToRecipes() {
    _selectedTab = FooderlichTab.recipes;
    notifyListeners();
  }

  void logout() {
    _loggedIn = false;
    _onBoardingComplete = false;
    _intialized = false;
    _selectedTab = 0;

    intializeApp();
    notifyListeners();
  }
}
