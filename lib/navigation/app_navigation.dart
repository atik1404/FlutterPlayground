
import 'package:first_flutter/feature/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../feature/home/bloc/homebloc/home_bloc.dart';
import '../feature/home/home_screen.dart';
import '../resources/AppImagePath.dart';
import 'app_screens.dart';

final class AppNavigation{
  Route onNavigationChange(RouteSettings routeSettings){
    final args = routeSettings.arguments;

    switch(routeSettings.name){
      case AppScreens.loginScreen:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginScreen());

      case AppScreens.homeScreen:
        return MaterialPageRoute(
            builder: (context)=> MultiBlocProvider(
              providers: [
                BlocProvider(create: (_)=>HomeBloc(AppImagePath.sliderImage.length)),
              ],
              child: const HomeScreen(),
            )
        );

      default:
        return MaterialPageRoute(
            builder: (context)=> const Center(child: Text("No Route Found"))
        );
    }
  }
}