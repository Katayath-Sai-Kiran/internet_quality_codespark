import '../enums/internet_quality_level.dart';

class InternetQualityResult {
  final InternetQualityLevel quality;
  /// Latency in milliseconds for DNS lookup. -1 if measurement failed.
  final int dnsLatencyMs;

  /// Latency in milliseconds for socket connection. -1 if measurement failed.
  final int socketLatencyMs;

  /// Latency in milliseconds for HTTP request. -1 if measurement failed.
  final int httpLatencyMs;

  /// Average latency in milliseconds. -1 if measurement failed.
  final int averageLatencyMs;

  /// Timestamp of the measurement.
  final DateTime timestamp;

  const InternetQualityResult({
    required this.quality,
    required this.dnsLatencyMs,
    required this.socketLatencyMs,
    required this.httpLatencyMs,
    required this.averageLatencyMs,
    required this.timestamp,
  });
}
