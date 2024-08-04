import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nil/nil.dart';
import 'package:two_pane_view/responsive_view.dart';
import 'package:two_pane_view/two_pane_view.dart';

void main() {
  testWidgets('Responsive view test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      Builder(
        builder: (BuildContext context) {
          double screenSize = MediaQuery.of(context).size.width;
          return MaterialApp(
            home: Row(
              children: <Widget> [
                TwoPaneView(
                    leftPane: Responsive.xs.narrower(screenSize)
                        ? nil : const Text('Left Pane'),
                    rightPane: const Text('Right Pane'),
                    ratio: 3,
                    screenBreakpoint: Responsive.xs,
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0)
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