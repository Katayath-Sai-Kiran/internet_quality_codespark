import '../models/internet_quality_result.dart';
import '../services/internet_quality_service.dart';

class InternetQualityMonitor {
  static Stream<InternetQualityResult> monitor({
    Duration interval = const Duration(seconds: 5),
  }) {
    return Stream.periodic(
      interval,
    ).asyncMap(
      (_) => InternetQualityService.checkDetailed(),
    );
  }
}
