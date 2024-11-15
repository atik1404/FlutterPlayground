import 'package:first_flutter/home_screen.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

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
      home: const PasswordField(),
    );
  }
}
