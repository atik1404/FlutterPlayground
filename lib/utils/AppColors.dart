import 'dart:convert';
import 'package:flutter/services.dart';

class AppColors {
  static Map<String, String>? _colorMap;

  // Load colors from JSON file
  static Future<void> load() async {
    final String jsonString =
        await rootBundle.loadString('assets/app_colors.json');
    _colorMap = Map<String, String>.from(json.decode(jsonString));
  }

  // Helper method to get color from hex string
  static Color _fromHex(String hexColor) {
    hexColor = hexColor.replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor'; // Add alpha value if missing
    }
    return Color(int.parse(hexColor, radix: 16));
  }

  // Method to get color by key
  static Color getColor(String key) {
    if (_colorMap == null) {
      throw Exception("AppColors not loaded. Call AppColors.load() first.");
    }
    final hexColor = _colorMap![key];
    if (hexColor == null) {
      throw Exception("Color key '$key' not found.");
    }
    return _fromHex(hexColor);
  }
}
