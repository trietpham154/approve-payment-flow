import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:approve_payment_flow/presentation/root/root_state.dart';

final rootControllerProvider =
    NotifierProvider<RootController, RootUiState>(RootController.new);

class RootController extends Notifier<RootUiState> {
  static const int minSplashMs = 900;
  Timer? _timer;

  @override
  RootUiState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });

    _timer = Timer(const Duration(milliseconds: minSplashMs), () {
      state = const RootReadyState();
    });

    return const RootSplashState();
  }
}
