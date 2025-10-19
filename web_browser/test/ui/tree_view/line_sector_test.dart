import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_browser/tree_view/tree_sector/child/line_sector.dart';

void main() {
  group('LineSector Tests', () {
    testWidgets('should create LineWidget correctly', (WidgetTester tester) async {
      // Setup
      final lineWidget = LineWidget(
        starPos: Offset(0, 0),
        endPos: Offset(100, 100),
      );
      
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: lineWidget,
            ),
          ),
        ),
      );

      // Verify CustomPaint is used for drawing
      expect(find.byType(CustomPaint), findsOneWidget);
    });

    testWidgets('should display LineSector with multiple lines', (WidgetTester tester) async {
      // Setup
      final lines = [
        LineWidget(starPos: Offset(0, 0), endPos: Offset(50, 100)),
        LineWidget(starPos: Offset(0, 0), endPos: Offset(100, 100)),
        LineWidget(starPos: Offset(0, 0), endPos: Offset(150, 100)),
      ];
      
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: LineSector(lines: lines),
            ),
          ),
        ),
      );

      // Verify Stack is used to display multiple lines
      expect(find.byType(Stack), findsOneWidget);
      
      // Verify all lines are displayed
      expect(find.byType(LineWidget), findsNWidgets(3));
    });

    testWidgets('should use CustomPaint for line drawing', (WidgetTester tester) async {
      // Setup
      final lineWidget = LineWidget(
        starPos: Offset(10, 20),
        endPos: Offset(110, 120),
      );
      
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: lineWidget,
            ),
          ),
        ),
      );

      // Verify CustomPaint is used
      expect(find.byType(CustomPaint), findsOneWidget);
      
      // Get the CustomPaint widget
      final customPaint = tester.widget<CustomPaint>(find.byType(CustomPaint));
      expect(customPaint.painter, isA<LinePainter>());
    });

    testWidgets('should handle empty lines list', (WidgetTester tester) async {
      // Setup
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: LineSector(lines: []),
            ),
          ),
        ),
      );

      // Verify Stack is still displayed (even with no lines)
      expect(find.byType(Stack), findsOneWidget);
      
      // Verify no LineWidgets are displayed
      expect(find.byType(LineWidget), findsNothing);
    });

    testWidgets('should create line with correct offset values', (WidgetTester tester) async {
      // Setup
      const startOffset = Offset(20, 30);
      const endOffset = Offset(120, 130);
      
      final lineWidget = LineWidget(
        starPos: startOffset,
        endPos: endOffset,
      );
      
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: lineWidget,
            ),
          ),
        ),
      );

      // Verify the widget is created successfully
      expect(find.byType(LineWidget), findsOneWidget);
    });
  });
}
