import '../constants/thresholds.dart';
import '../enums/internet_quality_level.dart';

class QualityCalculator {
  static InternetQualityLevel classify(
    int latency,
  ) {
    if (latency <= InternetQualityThresholds.excellent) {
      return InternetQualityLevel.excellent;
    }

    if (latency <= InternetQualityThresholds.good) {
      return InternetQualityLevel.good;
    }

    if (latency <= InternetQualityThresholds.poor) {
      return InternetQualityLevel.poor;
    }

    return InternetQualityLevel.veryPoor;
  }
}
