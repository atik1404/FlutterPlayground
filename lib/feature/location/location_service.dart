// import 'package:first_flutter/logger.dart';
// import 'package:geolocator/geolocator.dart';
// import 'dart:async';
// import 'package:workmanager/workmanager.dart';
//
// class LocationService {
//   static Timer? _timer;
//   static final StreamController<Position?> _locationStreamController =
//   StreamController<Position?>.broadcast();
//
//   static Stream<Position?> get locationStream =>
//       _locationStreamController.stream;
//
//   /// Request permissions
//   static Future<void> requestPermission() async {
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       Logger.log("Location services are disabled.");
//       return;
//     }
//
//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//     }
//
//     if (permission == LocationPermission.denied ||
//         permission == LocationPermission.deniedForever) {
//       Logger.log("Location permission denied.");
//       return;
//     }
//   }
//
//   static Future<void> getCurrentLocation() async {
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       Logger.log("Location services are disabled.");
//       return;
//     }
//
//     const LocationSettings locationSettings = LocationSettings(
//       accuracy: LocationAccuracy.high,
//       distanceFilter: 1,
//     );
//
//     Position position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);
//
//     _locationStreamController.add(position);
//     Logger.log("[Location] Lat: ${position.latitude}, Lng: ${position.longitude}");
//   }
//
//   static void startLocationUpdates() async {
//     await requestPermission();
//     getCurrentLocation();
//
//     _timer = Timer.periodic(const Duration(seconds: 15), (timer) async {
//       getCurrentLocation();
//     });
//   }
//
//   static void stopLocationUpdates() {
//     _timer?.cancel();
//   }
//
//   static void startBackgroundTracking() {
//     Workmanager().registerPeriodicTask(
//       "fetchBackgroundLocation",
//       "fetchLocation",
//       frequency: const Duration(minutes: 15),
//       constraints: Constraints(
//         networkType: NetworkType.connected,
//         requiresBatteryNotLow: true,
//       ),
//     );
//     Logger.log("Background location tracking started.");
//   }
//
//   static void stopBackgroundTracking() {
//     Workmanager().cancelByUniqueName("fetchBackgroundLocation");
//     Logger.log("Background location tracking stopped.");
//   }
// }
