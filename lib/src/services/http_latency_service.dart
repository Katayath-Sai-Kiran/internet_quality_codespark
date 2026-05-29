import 'dart:io';

import '../core/endpoint_provider.dart';

class HttpLatencyService {
  /// Measures the HTTP request latency in milliseconds. Returns null if the measurement fails.
  static Future<int?> measure(
      {Duration timeout = const Duration(seconds: 5)}) async {
    try {
      final stopwatch = Stopwatch()..start();
      final client = HttpClient();
      final request = await client.getUrl(
        Uri.parse(EndpointProvider.httpEndpoint),
      );
      // Perform an HTTP request to measure latency. We use the httpEndpoint from EndpointProvider.
      final response = await request.close().timeout(timeout);
      await response.drain();
      stopwatch.stop();
      client.close();
      return stopwatch.elapsedMilliseconds;
    } catch (_) {
      return null;
    }
  }
}
