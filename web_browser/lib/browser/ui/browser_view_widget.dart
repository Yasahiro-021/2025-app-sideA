import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/browser/ui/browser_app_bar.dart';
import 'package:web_browser/browser/ui/browser_bottom_bar.dart';
import 'package:web_browser/browser/ui/body/browser_floating_action_button.dart';
import 'package:web_browser/browser/ui/body/browser_web_view.dart';

///ブラウザ画面のエントリーポイント
class BrowserViewWidget extends StatelessWidget {
  const BrowserViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        theme: ThemeData(
          colorSchemeSeed: Colors.green,
          useMaterial3: true,
          brightness: Brightness.light,
        ),
        darkTheme: ThemeData(
          colorSchemeSeed: Colors.blue,
          useMaterial3: true,
          brightness: Brightness.dark,
        ),
        home: const _BrowserScaffold(),
      ),
    );
  }
}

/// ブラウザのScaffold部分（WebViewを含む）
class _BrowserScaffold extends ConsumerWidget {
  const _BrowserScaffold();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const BrowserAppBar(),
      body: const BrowserWebView(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: const BrowserFloatingActionButton(),
      bottomNavigationBar: const BrowserBottomBar(),
    );
  }
}
