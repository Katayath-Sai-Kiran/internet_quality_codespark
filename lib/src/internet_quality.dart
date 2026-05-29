import 'enums/internet_quality_level.dart';
import 'models/internet_quality_result.dart';
import 'monitors/internet_quality_monitor.dart';
import 'services/internet_quality_service.dart';

class InternetQuality {
  const InternetQuality._();

  static Future<InternetQualityLevel> check(
      {Duration timeout = const Duration(seconds: 5)}) async {
    final result = await checkDetailed(timeout: timeout);
    return result.quality;
  }

  static Future<bool> hasInternet(
      {Duration timeout = const Duration(seconds: 5)}) async {
    final result = await checkDetailed(timeout: timeout);
    return result.quality != InternetQualityLevel.offline;
  }

  static Future<int> getLatency(
      {Duration timeout = const Duration(seconds: 5)}) async {
    final result = await checkDetailed(timeout: timeout);
    return result.averageLatencyMs;
  }

  static Future<InternetQualityResult> checkDetailed(
      {Duration timeout = const Duration(seconds: 5)}) {
    return InternetQualityService.checkDetailed(timeout: timeout);
  }

  static Stream<InternetQualityResult> monitor({
    Duration interval = const Duration(seconds: 5),
  }) {
    return InternetQualityMonitor.monitor(
      interval: interval,
    );
  }
}
