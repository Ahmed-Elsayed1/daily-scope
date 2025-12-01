import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

/// Connectivity status enum
enum ConnectivityStatus {
  /// Connected to network
  online,
  
  /// Not connected to network
  offline,
}

/// Service for monitoring network connectivity status.
/// 
/// Provides both stream-based updates and one-time checks for connectivity status.
/// Uses the connectivity_plus package to detect network changes.
class ConnectivityService {
  ConnectivityService() {
    _subscription = _connectivity.onConnectivityChanged.listen(
      (results) => _handleConnectivity(
        results.isEmpty ? ConnectivityResult.none : results.first
      ),
    );
    _seedInitialStatus();
  }

  final Connectivity _connectivity = Connectivity();
  final StreamController<ConnectivityStatus> _controller =
      StreamController.broadcast();
  ConnectivityStatus _latestStatus = ConnectivityStatus.online;
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  /// Stream of connectivity status changes
  Stream<ConnectivityStatus> get statuses => _controller.stream;

  /// Get the latest connectivity status
  ConnectivityStatus get latestStatus => _latestStatus;

  /// Check if currently online
  bool get isOnline => _latestStatus == ConnectivityStatus.online;

  /// Check if currently offline
  bool get isOffline => _latestStatus == ConnectivityStatus.offline;

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

  /// Returns the current connectivity status
  Future<ConnectivityStatus> currentStatus() async {
    final results = await _connectivity.checkConnectivity();
    final result = results.isEmpty ? ConnectivityResult.none : results.first;
    return result == ConnectivityResult.none
        ? ConnectivityStatus.offline
        : ConnectivityStatus.online;
  }

  /// Dispose of resources
  void dispose() {
    _subscription?.cancel();
    _controller.close();
  }
}
