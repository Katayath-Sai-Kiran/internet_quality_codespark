import 'dart:io';

import '../core/endpoint_provider.dart';

class SocketLatencyService {
  static Future<int?> measure(
      {Duration timeout = const Duration(seconds: 5)}) async {
    try {
      final stopwatch = Stopwatch()..start();
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
