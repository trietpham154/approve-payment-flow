import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

abstract interface class Logger {
  void d(String tag, String message);
  void i(String tag, String message);
  void w(String tag, String message);
  void e(String tag, String message);
}

class AppLogger implements Logger {
  const AppLogger();

  @override
  void d(String tag, String message) {
    debugPrint('[$tag] $message');
    developer.log(message, name: tag, level: 500);
  }

  @override
  void i(String tag, String message) {
    debugPrint('[$tag] $message');
    developer.log(message, name: tag, level: 800);
  }

  @override
  void w(String tag, String message) {
    debugPrint('[$tag] $message');
    developer.log(message, name: tag, level: 900);
  }

  @override
  void e(String tag, String message) {
    debugPrint('[$tag] $message');
    developer.log(message, name: tag, level: 1000);
  }
}
