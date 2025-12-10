import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/debug/mock_node_usecase.dart';
import 'package:web_browser/main.dart';

/// デバッグ用のアプリエントリーポイント
/// モックデータが事前に設定された状態でアプリを起動します
class DebugApp extends ConsumerStatefulWidget {
  const DebugApp({super.key});

  @override
  ConsumerState<DebugApp> createState() => _DebugAppState();
}

class _DebugAppState extends ConsumerState<DebugApp> {
  @override
  void initState() {
    super.initState();
    // ウィジェットツリー構築後にモックデータを初期化
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mockNodeUsecase(ref);
    });
  }

  @override
  Widget build(BuildContext context) {
    // 本番のMyAppをそのまま使用
    return const MyApp();
  }
}
