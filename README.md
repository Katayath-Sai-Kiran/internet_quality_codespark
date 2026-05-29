<img src="https://raw.githubusercontent.com/Katayath-Sai-Kiran/internet_quality_codespark/master/assets/banner.png" alt="Banner"/>

# internet_quality_codespark

[![pub package](https://img.shields.io/pub/v/internet_quality_codespark.svg)](https://pub.dev/packages/internet_quality_codespark)
[![likes](https://img.shields.io/pub/likes/internet_quality_codespark)](https://pub.dev/packages/internet_quality_codespark)
[![pub points](https://img.shields.io/pub/points/internet_quality_codespark)](https://pub.dev/packages/internet_quality_codespark)
[![license](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

<img src="assets/readme/cover.png" alt="Internet Quality in Flutter" width="100%">
---

**Flutter internet quality · Flutter network quality · Internet latency monitoring · Network responsiveness · Internet diagnostics**

---

Measure real-world internet quality in Flutter applications.
---

## Feature Comparison

| Feature                  | connectivity_plus | internet_quality_codespark |
|-------------------------|:-----------------:|:-------------------------:|
| Connection Type         | ✅                | ❌                        |
| Internet Reachability   | ❌                | ✅                        |
| Latency Measurement     | ❌                | ✅                        |
| Quality Classification  | ❌                | ✅                        |
| Monitoring Stream       | ✅                | ✅                        |
| Zero Dependencies       | ❌                | ✅                        |

---

Unlike traditional connectivity packages that only report whether a device is connected to WiFi, mobile data, or Ethernet, `internet_quality_codespark` evaluates actual internet responsiveness and classifies network quality into meaningful categories such as **Excellent**, **Good**, **Poor**, **Very Poor**, and **Offline**.

Built with pure Dart and Flutter. No external dependencies.

---

## Why internet_quality_codespark?

Most connectivity solutions answer:

```text
WiFi
Mobile
Ethernet
Offline
```

However, applications often need answers to more important questions:

* Is the internet fast enough for a video call?
* Should I upload a large file right now?
* Is the network quality degrading?
* Can I safely fetch high-resolution content?
* Is the device connected but unable to reach the internet?

This package focuses on **internet quality** rather than simple connectivity status.

---

## Features

* Internet availability detection
* DNS latency measurement
* Socket latency measurement
* HTTP latency measurement
* Internet quality classification
* Detailed quality reports
* Continuous monitoring stream
* Pure Dart implementation
* No external dependencies
* Lightweight and easy to integrate

---

## Installation

Add the dependency:

```yaml
dependencies:
  internet_quality_codespark: latest
```

Install packages:

```bash
flutter pub get
```

Import:

```dart
import 'package:internet_quality_codespark/internet_quality_codespark.dart';
```

---

## Internet Quality Levels

```dart
enum InternetQualityLevel {
  excellent,
  good,
  poor,
  veryPoor,
  offline,
}
```

Example classifications:

| Latency   | Quality   |
| --------- | --------- |
| 0-150ms   | Excellent |
| 151-400ms | Good      |
| 401-800ms | Poor      |
| 801ms+    | Very Poor |
| Failure   | Offline   |

---

## Quick Start

---
### ![Check Internet Quality](assets/readme/check_internet_quality.png)
*Check Internet Quality Level*


### Check Internet Availability

```dart
final hasInternet =
    await InternetQuality.hasInternet();
```

Returns:

```dart
true
false
```

---

### Check Internet Quality
// ...existing code...

---
### ![Detailed Quality Report](assets/readme/detailed_quality_report.png)
*Get Detailed Internet Quality Metrics*


```dart
final quality =
    await InternetQuality.check();
```

Example:

```dart
if (quality ==
    InternetQualityLevel.poor) {
  // Reduce image quality
}
```

---

### Get Detailed Results
// ...existing code...

---
### ![Get Latency Report](assets/readme/get_latenncy_report.png)
*Get Current Average Latency*


```dart
final result =
    await InternetQuality.checkDetailed();
```

Example:

```dart
print(result.quality);
print(result.averageLatencyMs);
```

---

## Detailed Result Model

```dart
class InternetQualityResult {
  final InternetQualityLevel quality;

  final int dnsLatencyMs;

  final int socketLatencyMs;

  final int httpLatencyMs;

  final int averageLatencyMs;

  final DateTime timestamp;
}
```

Example:

```dart
final result =
    await InternetQuality.checkDetailed();

print(result.dnsLatencyMs);
print(result.socketLatencyMs);
print(result.httpLatencyMs);
print(result.averageLatencyMs);
```

---

## Monitor Internet Quality
// ...existing code...

---
### ![Monitor Logs](assets/readme/monitor_logs.png)
*Monitor Internet Quality Changes*


Listen continuously for quality changes:

```dart
InternetQuality.monitor(
  interval: Duration(seconds: 5),
).listen(
  (result) {
    print(result.quality);
  },
);
```

---

## Get Current Latency

```dart
final latency =
    await InternetQuality.getLatency();

print(latency);
```

Returns:

```dart
120
```

Latency is returned in milliseconds.

---

## Example Use Cases

### Adaptive Image Loading

```dart
final quality =
    await InternetQuality.check();

if (quality ==
    InternetQualityLevel.excellent) {
  loadHighResolutionImages();
} else {
  loadCompressedImages();
}
```

---

### Video Upload Protection

```dart
final quality =
    await InternetQuality.check();

if (quality ==
    InternetQualityLevel.poor ||
    quality ==
    InternetQualityLevel.veryPoor) {
  showRetryMessage();
}
```

---

### Network Diagnostics

```dart
final result =
    await InternetQuality.checkDetailed();

debugPrint(
  'Latency: ${result.averageLatencyMs}ms',
);
```

---

## How It Works

The package evaluates internet quality using multiple network checks:

### DNS Lookup

Measures DNS response latency.

```dart
InternetAddress.lookup(...)
```

### Socket Connection

Measures raw connection latency.

```dart
Socket.connect(...)
```

### HTTP Request

Measures actual internet responsiveness.

```dart
HttpClient(...)
```

The collected metrics are combined and classified into an internet quality level.

---

## Platform Support

| Platform | Supported |
| -------- | --------- |
| Android  | Yes       |
| iOS      | Yes       |
| macOS    | Yes       |
| Windows  | Yes       |
| Linux    | Yes       |
| Web      | Planned   |

---

## Roadmap

### Version 1.1.0

* Rolling average quality analysis
* Stability scoring
* Better classification algorithms

### Version 1.2.0

* Internet quality trend detection
* Improving network detection
* Degrading network detection

### Version 1.3.0

* Platform-specific network information
* Connection type detection
* Metered network support

### Version 2.0.0

* Video call suitability detection
* Upload suitability detection
* Streaming suitability detection
* Smart network recommendations

---

## Additional Flutter Packages

This package is part of a growing collection of Flutter utilities maintained by K Sai Kiran.

Explore more packages and developer resources:

Website: https://ksaikiran.dev

Publisher: https://pub.dev/publishers/ksaikiran.dev/packages

---

## About the Author

K Sai Kiran is a Flutter developer focused on building lightweight, developer-friendly Flutter packages and utilities.

Website:

https://ksaikiran.dev

---

## Contributing

Issues, suggestions, and pull requests are welcome.

Repository:

https://github.com/Katayath-Sai-Kiran/internet_quality_codespark

---

## License

MIT License

Copyright (c) 2026 Katayath Sai Kiran

See the LICENSE file for details.
