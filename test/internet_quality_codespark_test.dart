import 'package:flutter_test/flutter_test.dart';
import 'package:internet_quality_codespark/internet_quality_codespark.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group("Log detailed quality report", () {
    test('checkDetailed() logs all details', () async {
      final result = await InternetQuality.checkDetailed();
      print('Quality: ${result.quality}');
      print('DNS Latency: ${result.dnsLatencyMs} ms');
      print('Socket Latency: ${result.socketLatencyMs} ms');
      print('HTTP Latency: ${result.httpLatencyMs} ms');
      print('Average Latency: ${result.averageLatencyMs} ms');
      print('Timestamp: ${result.timestamp}');
    });
  });
  group("Log detailed latency report", () {
    test('getLatency() logs all details', () async {
      final result = await InternetQuality.getLatency();
      print('Average Latency: ${result} ms');
    });
  });
  group("Log detailed monitor report", () {
    test('monitor() logs all details', () async {
      final stream = InternetQuality.monitor(interval: Duration(seconds: 5));
      final sub = stream.listen((result) {
        print('Quality: ${result.quality}');
        print('Average Latency: ${result.averageLatencyMs} ms');
        print('Timestamp: ${result.timestamp}');
      });
      await Future.delayed(Duration(seconds: 20));
      await sub.cancel();
    });
  });

  group('InternetQuality', () {
    test('check() returns a valid quality', () async {
      final quality = await InternetQuality.check();
      print('InternetQuality.check() => $quality');
      expect(quality, isNotNull);
    });

    test('checkDetailed() returns a valid result', () async {
      final result = await InternetQuality.checkDetailed();
      print(
          'InternetQuality.checkDetailed() => quality: \\${result.quality}, dns: \\${result.dnsLatencyMs}, socket: \\${result.socketLatencyMs}, http: \\${result.httpLatencyMs}, avg: \\${result.averageLatencyMs}, timestamp: \\${result.timestamp}');
      expect(result, isNotNull);
      expect(result.quality, isNotNull);
    });

    test('hasInternet() returns a boolean', () async {
      final hasInternet = await InternetQuality.hasInternet();
      print('InternetQuality.hasInternet() => $hasInternet');
      expect(hasInternet, isA<bool>());
    });

    test('getLatency() returns an int', () async {
      final latency = await InternetQuality.getLatency();
      print('InternetQuality.getLatency() => $latency ms');
      expect(latency, isA<int>());
    });

    test('monitor() emits results', () async {
      final stream = InternetQuality.monitor(interval: Duration(seconds: 2));
      final results = <InternetQualityResult>[];
      final sub = stream.listen((result) {
        print(
            'InternetQuality.monitor() => quality: \\${result.quality}, avg: \\${result.averageLatencyMs}');
        results.add(result);
      });
      // Wait for a few events
      await Future.delayed(Duration(seconds: 7));
      await sub.cancel();
      expect(results.length, greaterThanOrEqualTo(2));
    });
  });
}
