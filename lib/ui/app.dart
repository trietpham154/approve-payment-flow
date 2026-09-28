import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:approve_payment_flow/presentation/root/root_controller.dart';
import 'package:approve_payment_flow/presentation/root/root_state.dart';
import 'package:approve_payment_flow/ui/approvals/approvals_screen.dart';
import 'package:approve_payment_flow/ui/navigation/destinations.dart';
import 'package:approve_payment_flow/ui/splash/splash_screen.dart';
import 'package:approve_payment_flow/ui/theme/theme.dart';

class ApprovePaymentFlowApp extends ConsumerWidget {
  const ApprovePaymentFlowApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rootState = ref.watch(rootControllerProvider);

    final router = GoRouter(
      initialLocation: Destinations.splash,
      routes: [
        GoRoute(
          path: Destinations.splash,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: Destinations.approvals,
          builder: (context, state) => const ApprovalsScreen(),
        ),
      ],
      redirect: (context, state) {
        final loc = state.matchedLocation;
        final isSplash = loc == Destinations.splash;

        if (rootState is RootSplashState) {
          return isSplash ? null : Destinations.splash;
        }

        if (rootState is RootReadyState) {
          if (isSplash) {
            return Destinations.approvals;
          }
        }

        return null;
      },
    );

    return MaterialApp.router(
      title: 'Approve Payment Flow',
      theme: approvePaymentFlowTheme,
      routerConfig: router,
    );
  }
}
