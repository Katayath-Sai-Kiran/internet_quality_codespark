import 'enums/internet_quality_level.dart';
import 'models/internet_quality_result.dart';
import 'monitors/internet_quality_monitor.dart';
import 'services/internet_quality_service.dart';

class InternetQuality {
  const InternetQuality._();

  /// Checks the current internet quality level with a default timeout of 5 seconds.
  /// Returns an [InternetQualityLevel] indicating the quality of the internet connection, which can be offline, poor, fair, good, or excellent based on the average latency measured. May return offline if all measurements fail.
  /// final result = await InternetQuality.check();
  /// Example:
  /// ```dart
  /// final result = await InternetQuality.check();
  /// print(result);
  /// ```
  static Future<InternetQualityLevel> check(
      {Duration timeout = const Duration(seconds: 5)}) async {
    final result = await checkDetailed(timeout: timeout);
    return result.quality;
  }

  /// Checks if there is an active internet connection with a default timeout of 5 seconds.
  /// Returns true if the internet quality is not classified as offline, and false if it is classified as offline. May return false if all measurements fail.
  /// final hasInternet = await InternetQuality.hasInternet();
  /// Example:
  /// ```dart
  /// final hasInternet = await InternetQuality.hasInternet();
  /// print(hasInternet);
  /// ```
  static Future<bool> hasInternet(
      {Duration timeout = const Duration(seconds: 5)}) async {
    final result = await checkDetailed(timeout: timeout);
    return result.quality != InternetQualityLevel.offline;
  }

  /// Gets the current average latency in milliseconds with a default timeout of 5 seconds.
  /// Returns the average latency in milliseconds calculated from the DNS, socket, and HTTP latency measurements. May return -1 if all measurements fail.
  /// final latency = await InternetQuality.getLatency();
  /// Example:
  /// ```dart
  /// final latency = await InternetQuality.getLatency();
  /// print(latency);
  /// ```
  static Future<int> getLatency(
      {Duration timeout = const Duration(seconds: 5)}) async {
    final result = await checkDetailed(timeout: timeout);
    return result.averageLatencyMs;
  }

  /// Checks the detailed internet quality with a default timeout of 5 seconds. May return -1 for latencies if measurements fail, and classifies quality as offline if all measurements fail.
  /// final result = await InternetQuality.checkDetailed();
  /// Example:
  /// ```dart
  /// final result = await InternetQuality.checkDetailed();
  /// print(result);
  /// ```
  static Future<InternetQualityResult> checkDetailed(
      {Duration timeout = const Duration(seconds: 5)}) {
    return InternetQualityService.checkDetailed(timeout: timeout);
  }

  /// Monitors the internet quality at regular intervals with a default interval of 5 seconds.
  /// Returns a stream of [InternetQualityResult] objects emitted at each interval, allowing you to track changes in internet quality over time. May emit results with -1 latencies and offline quality if measurements fail.
  /// final stream = InternetQuality.monitor();
  /// Example:
  /// ```dart
  /// final stream = InternetQuality.monitor();
  /// stream.listen((result) {
  ///   print(result);
  /// });
  /// ```
  static Stream<InternetQualityResult> monitor({
    Duration interval = const Duration(seconds: 5),
  }) {
    return InternetQualityMonitor.monitor(interval: interval);
  }
}
