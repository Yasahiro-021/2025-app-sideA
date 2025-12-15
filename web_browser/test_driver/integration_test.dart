import 'dart:io';

import 'package:integration_test/integration_test_driver.dart';
import 'package:path/path.dart' as p;

// 受け取ったスクリーンショットをscreenshots/配下に保存する
Future<void> main() => integrationDriver(
			onScreenshot: (String name, List<int> bytes) async {
				final dir = Directory('screenshots');
				if (!dir.existsSync()) {
					await dir.create(recursive: true);
				}

				final file = File(p.join(dir.path, '$name.png'));
				await file.writeAsBytes(bytes);

				return true; // trueを返すと保存成功として扱われる
			},
		);
