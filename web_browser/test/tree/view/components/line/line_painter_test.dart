import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:web_browser/tree/view/components/line_painter/line_painter.dart';

void main() {
  group('LinePainter', () {
    final List<Map<String, Offset>> testCases = [
      {'start': const Offset(0, 0), 'end': const Offset(100, 100)},
      {'start': const Offset(50, 50), 'end': const Offset(150, 150)},
      {'start': const Offset(100, 50), 'end': const Offset(150, 0)},
    ];
    testWidgets('正しく線を引けるか', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Stack(
              children: [
                ...testCases.map((c) {
                  return Positioned.fill(
                    child: CustomPaint(
                      size: Size.infinite,
                      painter: LinePainter(start: c['start']!, end: c['end']!),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      );
      // 検証
      for (var c in testCases) {
        final start = c['start']!;
        final end = c['end']!;
        final lineFinder = find.byWidgetPredicate((widget) {
          if (widget is CustomPaint) {
            final painter = widget.painter;
            if (painter is LinePainter) {
              return painter.start == start && painter.end == end;
            }
          }
          return false;
        });
        expect(lineFinder, findsOneWidget);
      }
    });
  });
}
