import 'dart:io';

import '../core/endpoint_provider.dart';

class DnsLatencyService {
  /// Measures the DNS latency in milliseconds. Returns null if the measurement fails.
  static Future<int?> measure(
      {Duration timeout = const Duration(seconds: 5)}) async {
    try {
      final stopwatch = Stopwatch()..start();
      // Perform a DNS lookup to measure latency. We use the dnsHost from EndpointProvider.
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
