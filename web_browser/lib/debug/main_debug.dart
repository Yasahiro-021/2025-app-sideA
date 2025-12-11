import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/debug/debug_app.dart';
import 'dart:developer';

/// デバッグ用のエントリーポイント
/// モックデータが設定された状態でアプリを起動します
/// 
/// 実行方法:
/// flutter run -t lib/debug/main_debug.dart
void main() {
  log('デバッグモードでアプリを起動します（モックデータ有効）');
  runApp(const ProviderScope(child: DebugApp()));
}
