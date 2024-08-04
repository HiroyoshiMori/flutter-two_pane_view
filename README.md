Two Pane View Layout for two size of layout to achieve good UI look and feel for different screen sizes.

## Features

With `TwoPainView` you can get the same behavior of two pane view layout in windows app.
Give two cells the ratio it shall occupy at every size category assuming the total width is 12 (by default).

## Getting started

## Usage

```dart
double screenSize = MediaQuery.of(context).size.width;
const twoPane = MaterialApp(
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
```

## Additional information
