import '../enums/internet_quality_level.dart';

class InternetQualityResult {
  final InternetQualityLevel quality;

  final int dnsLatencyMs;

  final int socketLatencyMs;

  final int httpLatencyMs;

  final int averageLatencyMs;

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
