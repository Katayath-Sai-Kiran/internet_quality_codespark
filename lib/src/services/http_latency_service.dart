import 'dart:io';

import '../core/endpoint_provider.dart';

class HttpLatencyService {
  static Future<int?> measure(
      {Duration timeout = const Duration(seconds: 5)}) async {
    try {
      final stopwatch = Stopwatch()..start();
      final client = HttpClient();
      final request = await client.getUrl(
        Uri.parse(EndpointProvider.httpEndpoint),
      );
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
