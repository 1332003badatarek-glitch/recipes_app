import 'dart:async';

class SessionManager {
  final StreamController<void> _controller = StreamController.broadcast();

  void notifySessionExpired() {
    if (!_controller.isClosed) _controller.add(null);
  }

  void dispose() {
    _controller.close();
  }
}
