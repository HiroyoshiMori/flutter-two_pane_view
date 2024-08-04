import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:two_pane_view/responsive_view.dart';
import 'package:two_pane_view/two_pane_view.dart';

void main() {
  testWidgets('Responsive view test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      Builder(
        builder: (BuildContext context) {
          double screenSize = MediaQuery.of(context).size.width;
          Responsive screenBreakpoint = Responsive.xs;
          int totalRatio = 12;
          int leftRatio = 1;

          return MaterialApp(
            home: ResponsiveView(
              screenBreakpoint: screenBreakpoint,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: screenBreakpoint.narrower(screenSize)
                      ? 1 : leftRatio,
                  child: const Text('Left Pane'),
                ),
                Expanded(
                  flex: screenBreakpoint.narrower(screenSize)
                      ? 1 : (totalRatio - leftRatio),
                  child: const Text('Right Pane'),
                ),
              ],
            ),
          );
        }
      )
    );
    expect(find.text('Left Pane'), findsOneWidget);
    expect(find.text('Right Pane'), findsOneWidget);
  });
}