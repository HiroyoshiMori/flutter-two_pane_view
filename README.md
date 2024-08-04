Two Pane View Layout for two size of layout to achieve good UI look and feel for different screen sizes.

## Features

With `TwoPainView` you can get the same behavior of two pane view layout in windows app.
Give two cells the ratio it shall occupy at every size category assuming the total width is 12 (by default).

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart
double screenSize = MediaQuery.of(context).size.width;
const twoPane = TwoPaneView(
    leftPane: Responsive.xs.narrower(screenSize) ? nil : Text('Left Pane'),
    rightPane: Text('Right Pane'),
    ratio: 3,
    screenBreakpoint: Responsive.xs,
    padding: const EdgeInsets.only(left: 20.0, right: 20.0)
);
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
