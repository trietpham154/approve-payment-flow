import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:approve_payment_flow/core/di/dependency_injection.dart';
import 'package:approve_payment_flow/core/logging/logger.dart';
import 'package:approve_payment_flow/ui/app.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await configureDependencies();

    FlutterError.onError = (details) {
      getIt<Logger>().e(
        'FlutterError',
        '${details.exceptionAsString()}\n${details.stack}',
      );
    };

    runApp(
      const ProviderScope(
        child: ApprovePaymentFlowApp(),
      ),
    );
  }, (error, stack) {
    getIt<Logger>().e('UncaughtException', '$error\n$stack');
  });
}
