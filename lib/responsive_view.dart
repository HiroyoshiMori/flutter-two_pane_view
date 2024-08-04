library responsive_view;

import 'package:flutter/cupertino.dart';

enum Responsive {
  xs(maxWidth: 576),
  sm(minWidth: 576, maxWidth: 768),
  md(minWidth: 768, maxWidth: 992),
  lg(minWidth: 992, maxWidth: 1200),
  xl(minWidth: 1200, maxWidth: 1400),
  xxl(minWidth: 1400),
  ;

  const Responsive({
    this.maxWidth = double.infinity,
    this.minWidth = 0,
  });
  final double minWidth;
  final double maxWidth;
}

extension ResponsiveExtension on Responsive {
  bool narrower(double? width) {
    return width != null ? width <= maxWidth : false;
  }
  bool wider(double? width) {
    return width != null ? width > maxWidth : false;
  }
  Responsive? getType(double? width) {
    if (width != null) {
      for (var element in Responsive.values) {
        if (width >= element.minWidth && width < element.maxWidth) {
          return element;
        }
      }
    }
    return null;
  }
}

class ResponsiveView extends StatefulWidget {
  const ResponsiveView({
    super.key,
    this.screenBreakpoint = Responsive.xs,
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.verticalDirection = VerticalDirection.down,
    this.textDirection,
    this.textBaseline,
  });

  final Responsive screenBreakpoint;
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final VerticalDirection verticalDirection;
  final TextDirection? textDirection;
  final TextBaseline? textBaseline;

  @override
  State<StatefulWidget> createState() => _ResponsiveViewState();
}

class _ResponsiveViewState extends State<ResponsiveView> {
  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;
    return widget.screenBreakpoint.narrower(screenSize) ? Column(
      mainAxisAlignment: widget.mainAxisAlignment,
      mainAxisSize: widget.mainAxisSize,
      crossAxisAlignment: widget.crossAxisAlignment,
      verticalDirection: widget.verticalDirection,
      textDirection: widget.textDirection,
      textBaseline: widget.textBaseline,
      children: widget.children,
    ) : Row(
      mainAxisAlignment: widget.mainAxisAlignment,
      mainAxisSize: widget.mainAxisSize,
      crossAxisAlignment: widget.crossAxisAlignment,
      verticalDirection: widget.verticalDirection,
      textDirection: widget.textDirection,
      textBaseline: widget.textBaseline,
      children: widget.children,
    );
  }
}