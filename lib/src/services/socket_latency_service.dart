import 'dart:io';

import '../core/endpoint_provider.dart';

class SocketLatencyService {
  /// Measures the socket connection latency in milliseconds. Returns null if the measurement fails.
  static Future<int?> measure(
      {Duration timeout = const Duration(seconds: 5)}) async {
    try {
      
      final stopwatch = Stopwatch()..start();
      // Perform a socket connection to measure latency. We use the socketHost and socketPort from EndpointProvider.
      final socket = await Socket.connect(
        EndpointProvider.socketHost,
        EndpointProvider.socketPort,
        timeout: timeout,
      );
      stopwatch.stop();
      socket.destroy();
      return stopwatch.elapsedMilliseconds;
    } catch (_) {
      return null;
    }
  }
}
