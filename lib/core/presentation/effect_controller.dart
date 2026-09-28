import 'dart:async';

class EffectController<E> {
  final _controller = StreamController<E>.broadcast();

  Stream<E> get stream => _controller.stream;

  void send(E effect) {
    if (!_controller.isClosed) {
      _controller.add(effect);
    }
  }

  void dispose() {
    _controller.close();
  }
}
