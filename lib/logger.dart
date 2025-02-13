import 'package:flutter/foundation.dart';

final class Logger{
  static void log<T>(T message) {
    if (kDebugMode) {
      debugPrint(message.toString());
    }
  }
}