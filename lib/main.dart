import 'package:first_flutter/feature/playground/chip/chip_component_playground.dart';
import 'package:first_flutter/navigation/app_navigation.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appNavigation = AppNavigation();
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ChipComponentPlayground(),
      onGenerateRoute: appNavigation.onNavigationChange,
      debugShowCheckedModeBanner: false,
    );
  }
}
