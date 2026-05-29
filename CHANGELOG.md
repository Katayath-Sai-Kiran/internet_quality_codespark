## 1.0.0

Initial release.

### Features
- Internet availability detection
- DNS, Socket, and HTTP latency measurement
- Internet quality classification (Excellent, Good, Poor, Very Poor, Offline)
- Detailed quality reports with all latency metrics
- Continuous monitoring stream (real-time updates)
- Pure Dart implementation, zero dependencies

### Enhancements
- All network checks use a default 5s timeout (user-configurable)
- Public API methods accept custom timeout parameter
- Robust error handling for offline/partial failure scenarios
- SEO improvements and feature comparison table in README
- Screenshots and code snippets mapped in README for pub.dev
- Unique screenshot descriptions in pubspec.yaml for pub.dev display

### Testing & Quality
- Comprehensive tests for all public APIs
- Debug logs for all test cases
- Guidance for simulating poor/worst-case network conditions

### Documentation
- Example use cases and code snippets
- Screenshot asset mapping for pub.dev