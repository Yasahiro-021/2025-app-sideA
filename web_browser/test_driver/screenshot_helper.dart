import 'package:integration_test/integration_test.dart';

final IntegrationTestWidgetsFlutterBinding _binding =
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

// integrationテスト中にスクリーンショットを保存する
Future<void> captureScreenshot(String name) async {
  final DateTime now = DateTime.now();
  final String timestamp =
      '${now.year.toString().padLeft(4, '0')}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}_${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}${now.second.toString().padLeft(2, '0')}';
  final String filename = '${name}_$timestamp';

  await _binding.takeScreenshot(filename);
}
