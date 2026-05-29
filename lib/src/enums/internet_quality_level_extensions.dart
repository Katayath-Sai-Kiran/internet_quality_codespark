import '../enums/internet_quality_level.dart';

extension InternetQualityLevelX on InternetQualityLevel {
  bool get isExcellent => this == InternetQualityLevel.excellent;

  bool get isGood => this == InternetQualityLevel.good;

  bool get isPoor => this == InternetQualityLevel.poor;

  bool get isVeryPoor => this == InternetQualityLevel.veryPoor;

  bool get isOffline => this == InternetQualityLevel.offline;
}
