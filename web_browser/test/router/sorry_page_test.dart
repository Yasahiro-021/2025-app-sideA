import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/router/router.dart';

void main() {
  testWidgets('should show sorry page when route cannot be resolved', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp.router(
          routeInformationProvider: router.routeInformationProvider,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
        ),
      ),
    );

    router.go('/does-not-exist');
    await tester.pumpAndSettle();

    expect(find.text('申し訳ありません'), findsOneWidget);
    expect(find.text('ホームへ戻る'), findsOneWidget);
  });
}