import '../core/quality_calculator.dart';
import '../enums/internet_quality_level.dart';
import '../models/internet_quality_result.dart';
import 'dns_latency_service.dart';
import 'http_latency_service.dart';
import 'socket_latency_service.dart';

class InternetQualityService {
  static Future<InternetQualityResult> checkDetailed(
      {Duration timeout = const Duration(seconds: 5)}) async {
    final results = await Future.wait([
      DnsLatencyService.measure(timeout: timeout),
      SocketLatencyService.measure(timeout: timeout),
      HttpLatencyService.measure(timeout: timeout),
    ]);

    final dnsLatency = results[0];
    final socketLatency = results[1];
    final httpLatency = results[2];

    /// If all measurements failed, classify as offline with -1 latencies
    if (dnsLatency == null && socketLatency == null && httpLatency == null) {
      return InternetQualityResult(
        quality: InternetQualityLevel.offline,
        dnsLatencyMs: -1,
        socketLatencyMs: -1,
        httpLatencyMs: -1,
        averageLatencyMs: -1,
        timestamp: DateTime.now(),
      );
    }

    /// Calculate average latency from valid measurements
    final validLatencies = [
      dnsLatency,
      socketLatency,
      httpLatency,
    ].whereType<int>().toList();

    final averageLatency =
        validLatencies.reduce((a, b) => a + b) ~/ validLatencies.length;

    final quality = QualityCalculator.classify(averageLatency);

    /// Return a detailed result with all measurements and the calculated quality
    return InternetQualityResult(
      quality: quality,
      dnsLatencyMs: dnsLatency ?? -1,
      socketLatencyMs: socketLatency ?? -1,
      httpLatencyMs: httpLatency ?? -1,
      averageLatencyMs: averageLatency,
      timestamp: DateTime.now(),
    );
  }
}
