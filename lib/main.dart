import 'package:first_flutter/feature/login/login_screen.dart';
import 'package:first_flutter/feature/notification/notification_services.dart';
import 'package:first_flutter/navigation/app_navigation.dart';
import 'package:flutter/material.dart';

import 'feature/notification/notification_repository.dart';
import 'feature/notification/notification_screen.dart';

// void callbackDispatcher() {
//   Workmanager().executeTask((task, inputData) async {
//     Logger.log("[WorkManager] Task executed at ${DateTime.now()}");
//     return Future.value(true);
//   });
// }
//
// void startRecursiveWorkManager() async {
//   while (true) {
//     await Future.delayed(const Duration(seconds: 5));
//
//     Workmanager().registerOneOffTask(
//       "recurringTask_${DateTime.now().millisecondsSinceEpoch}", // Unique task name
//       "fetchData",
//     );
//
//     Logger.log("[WorkManager] Scheduled a new task at ${DateTime.now()}");
//     LocationService.locationStream.listen((position) {
//       Logger.log("Updated location: ${position?.latitude}, ${position?.longitude}");
//     });
//   }
// }


void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await LocationService.getCurrentLocation();
  // Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  // startRecursiveWorkManager();
  // await LocationService.getCurrentLocation();
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationRepository.initialization();
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
      home: const NotificationScreen(),
      onGenerateRoute: appNavigation.onNavigationChange,
      debugShowCheckedModeBanner: false,
    );
  }
}