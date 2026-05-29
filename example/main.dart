import 'dart:async';

import 'package:flutter/rendering.dart';
import 'package:internet_quality_codespark/internet_quality_codespark.dart';

void main() async {
  // Example: Check internet quality level
  final quality = await InternetQuality.check();
  debugPrint('Internet Quality: $quality');

  // Example: Get detailed quality report
  final result = await InternetQuality.checkDetailed();
  debugPrint('Detailed Quality Report:');
  debugPrint('  Quality: ${result.quality}');
  debugPrint('  DNS Latency: ${result.dnsLatencyMs} ms');
  debugPrint('  Socket Latency: ${result.socketLatencyMs} ms');
  debugPrint('  HTTP Latency: ${result.httpLatencyMs} ms');
  debugPrint('  Average Latency: ${result.averageLatencyMs} ms');
  debugPrint('  Timestamp: ${result.timestamp}');

  // Example: Check if internet is available
  final hasInternet = await InternetQuality.hasInternet();
  debugPrint('Has Internet: $hasInternet');

  // Example: Get current average latency
  final latency = await InternetQuality.getLatency();
  debugPrint('Average Latency: $latency ms');

  // Example: Monitor internet quality changes (prints 3 updates then exits)
  int count = 0;
  late final StreamSubscription<InternetQualityResult> subscription;
  subscription =
      InternetQuality.monitor(interval: Duration(seconds: 2)).listen((result) {
    debugPrint(
        'Monitor Update: ${result.quality}, Avg Latency: ${result.averageLatencyMs} ms');
    count++;
    if (count >= 3) {
      subscription.cancel();
    }
  });
}
