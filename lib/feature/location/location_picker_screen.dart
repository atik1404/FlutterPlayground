// import 'dart:async';
//
// import 'package:first_flutter/logger.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:workmanager/workmanager.dart';
//
// import '../../resources/AppColors.dart';
// import '../../resources/AppDimensions.dart';
// import 'location_service.dart';
//
// class LocationPickerScreen extends StatefulWidget {
//   const LocationPickerScreen({super.key});
//
//   @override
//   State<LocationPickerScreen> createState() => _LocationPickerState();
// }
//
// class _LocationPickerState extends State<LocationPickerScreen> {
//   Position? _currentPosition;
//   String latitude = '';
//   String longitude = '';
//
//   @override
//   void initState() {
//     super.initState();
//     LocationService.startLocationUpdates(); // Start fetching location every 15 seconds
//
//     LocationService.locationStream.listen((position) {
//       setState(() {
//         _currentPosition = position;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     LocationService.stopLocationUpdates(); // Stop timer when screen is disposed
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Current location')),
//       body: Column(
//         children: [
//           Center(
//             child: _currentPosition != null
//                 ? Text(
//               textAlign: TextAlign.center,
//               "Latitude: ${_currentPosition!.latitude}, \nLongitude: ${_currentPosition!.longitude}",
//             )
//                 : const CircularProgressIndicator(),
//           ),
//         ],
//       ),
//     );
//   }
// }
