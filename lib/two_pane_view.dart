library two_pane_view;
import 'package:nil/nil.dart';

import 'package:flutter/cupertino.dart';
import './responsive_view.dart';

class TwoPaneView extends StatefulWidget {
  const TwoPaneView({
    super.key,
    this.leftPane = nil,
    this.rightPane = nil,
    this.ratio = 0,
    this.totalRatio = 12,
    this.screenBreakpoint = Responsive.xs,
    this.padding = const EdgeInsets.all(0),
  });

  final Widget leftPane;
  final Widget rightPane;
  final int ratio;
  final int totalRatio;
  final Responsive screenBreakpoint;
  final EdgeInsetsGeometry padding;

  @override
  State<StatefulWidget> createState() => _TwoPaneViewState();
}

class _TwoPaneViewState extends State<TwoPaneView> {
  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;
    return Expanded(
      child: Padding(
        padding: widget.padding,
        child: ResponsiveView(
          screenBreakpoint: widget.screenBreakpoint,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Expanded(
              flex: widget.screenBreakpoint.narrower(screenSize)
                  ? 1 : widget.ratio,
              child: widget.leftPane,
            ),
            Expanded(
              flex: widget.screenBreakpoint.narrower(screenSize)
                  ? 1 : (widget.totalRatio - widget.ratio),
              child: widget.rightPane,
            ),
          ],
        ),
      ),
    );
  }
}

class ColumnOrRow extends StatelessWidget {
  const ColumnOrRow({
    super.key,
    this.showColumn = false,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.verticalDirection = VerticalDirection.down,
    this.textDirection,
    this.textBaseline,
  });

  final bool showColumn;
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final VerticalDirection verticalDirection;
  final TextDirection? textDirection;
  final TextBaseline? textBaseline;

  @override
  Widget build(BuildContext context) {
    return showColumn ? Column(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      verticalDirection: verticalDirection,
      textDirection: textDirection,
      textBaseline: textBaseline,
      children: children,
    ) : Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      verticalDirection: verticalDirection,
      textDirection: textDirection,
      textBaseline: textBaseline,
      children: children,
    );
  }
}