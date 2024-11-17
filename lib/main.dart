import 'package:equatable/equatable.dart';
import 'package:first_flutter/feature/home/bloc/movie_cubit.dart';
import 'package:first_flutter/feature/home/home_screen.dart';
import 'package:first_flutter/feature/playground/shopping_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/login/login_screen.dart';

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
      home: BlocProvider(
        create: (_)=>MovieCubit(),
        child: const HomeScreen(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Person {
  final String name;
  Person({required this.name});
}