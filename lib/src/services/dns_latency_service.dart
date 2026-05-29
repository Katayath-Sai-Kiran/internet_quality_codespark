import 'dart:io';

import '../core/endpoint_provider.dart';

class DnsLatencyService {
  static Future<int?> measure(
      {Duration timeout = const Duration(seconds: 5)}) async {
    try {
      final stopwatch = Stopwatch()..start();
      await InternetAddress.lookup(
        EndpointProvider.dnsHost,
      ).timeout(timeout);
      stopwatch.stop();
      return stopwatch.elapsedMilliseconds;
    } catch (_) {
      return null;
    }
  }
}
