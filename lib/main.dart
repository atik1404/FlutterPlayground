import 'package:first_flutter/feature/home/home_screen.dart';
import 'package:first_flutter/navigation/app_navigation.dart';
import 'package:first_flutter/resources/AppImagePath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/home/bloc/homebloc/home_bloc.dart';


void main(){
  //WidgetsFlutterBinding.ensureInitialized();
  //await AppColors.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appNavigation = AppNavigation();
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const LoginScreen(),
      // home: MultiBlocProvider(
      //     providers: [
      //       BlocProvider(create: (_)=>CartCubit(),),
      //       BlocProvider(create: (context)=>CheckoutCubit(context.read<CartCubit>()),),
      //     ],
      //     child: ShoppingScreen()
      // ),
      onGenerateRoute: appNavigation.onNavigationChange,
      debugShowCheckedModeBanner: false,
    );
  }
}

class Person {
  final String name;
  Person({required this.name});
}