
import 'package:first_flutter/feature/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'app_screens.dart';

final class AppNavigation{
  Route onNavigationChange(RouteSettings routeSettings){
    switch(routeSettings.name){
      case AppScreens.loginScreen:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginScreen());

      default:
        return MaterialPageRoute(
            builder: (context)=> const Center(child: Text("No Route Found"))
        );
    }
  }
}