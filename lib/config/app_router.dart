import 'package:flutter/material.dart';
import 'package:dating/models/models.dart';
import 'package:dating/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    // print('The Route is: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case UsersScreen.routeName:
        return UsersScreen.route(user: settings.arguments as User);
      case MatchesScreen.routeName:
        return MatchesScreen.route();
      case ProfileScreen.routeName:
        return ProfileScreen.route();
      case Authenticate.routeName:
        return Authenticate.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(appBar: AppBar(title: const Text('error'))),
      settings: const RouteSettings(name: '/error'),
    );
  }
}
