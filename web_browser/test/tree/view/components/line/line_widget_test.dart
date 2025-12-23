import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:web_browser/tree/view/components/line_painter/line_widget.dart';

void main() {
  group('LineWidget', () {
    final List<(Offset, Offset)> testCases = [
      (Offset(0, 0), Offset(100, 100)),
      (Offset(50, 50), Offset(150, 150)),
      (Offset(10, 20), Offset(30, 1000)),
    ];
    testWidgets('正しく作成されること', (WidgetTester tester) async {
      //テストの環境を構築し、LineWidgetを表示する
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                // 各テストケースに対してLineWidgetを作成
                for (var c in testCases) LineWidget(start: c.$1, end: c.$2),
              ],
            ),
          ),
        ),
      );
      // テストケースの数だけLineWidgetが作成されている
      final finder = find.byType(LineWidget);
      expect(
        finder,
        findsExactly(testCases.length),
        reason: '生成されたLineWidgetの数が正しくありません',
      );

      // 各LineWidgetが正しいstartとendを持っている
      for (var i = 0; i < testCases.length; i++) {
        final lineWidget = tester.widget<LineWidget>(finder.at(i));
        expect(
          lineWidget.start,
          testCases[i].$1,
          reason: 'LineWidgetのstartが正しくありません',
        );
        expect(
          lineWidget.end,
          testCases[i].$2,
          reason: 'LineWidgetのendが正しくありません',
        );
      }
    });
  });
}
