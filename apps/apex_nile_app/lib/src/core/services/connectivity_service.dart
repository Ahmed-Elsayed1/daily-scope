import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

enum ConnectivityStatus { online, offline }

class ConnectivityService {
  ConnectivityService() {
    _subscription = _connectivity.onConnectivityChanged.listen(
      (results) => _handleConnectivity(results.isEmpty
          ? ConnectivityResult.none
          : results.first),
    );
    _seedInitialStatus();
  }

  final Connectivity _connectivity = Connectivity();
  final StreamController<ConnectivityStatus> _controller =
      StreamController.broadcast();
  ConnectivityStatus _latestStatus = ConnectivityStatus.online;
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  Stream<ConnectivityStatus> get statuses => _controller.stream;

  ConnectivityStatus get latestStatus => _latestStatus;

  Future<void> _seedInitialStatus() async {
    final results = await _connectivity.checkConnectivity();
    final result = results.isEmpty ? ConnectivityResult.none : results.first;
    _handleConnectivity(result);
  }

  void _handleConnectivity(ConnectivityResult result) {
    final nextStatus = result == ConnectivityResult.none
        ? ConnectivityStatus.offline
        : ConnectivityStatus.online;
    if (nextStatus != _latestStatus) {
      _latestStatus = nextStatus;
      _controller.add(nextStatus);
    } else if (_controller.hasListener) {
      _controller.add(nextStatus);
    }
  }

  Future<ConnectivityStatus> currentStatus() async {
    final results = await _connectivity.checkConnectivity();
    final result = results.isEmpty ? ConnectivityResult.none : results.first;
    return result == ConnectivityResult.none
        ? ConnectivityStatus.offline
        : ConnectivityStatus.online;
  }

  void dispose() {
    _subscription?.cancel();
    _controller.close();
  }
}
