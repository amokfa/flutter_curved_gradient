library curved_gradient;

import 'package:flutter/widgets.dart';

/// Generate a custom [LinearGradient] using a custom curve function.
///
/// [begin], [end], [colors] and [stops] arguments are the same as [LinearGradient]
/// except that [colors] and [stops] must have two elements.
///
/// Both elements of [stops] must be between 0 and 1
///
/// [granularity] : Describes how fine you want your gradient to be. Higher is
/// smoother.
///
/// [curveGenerator] : This function will be called [granularity] times with values
/// between 0 and 1. colors[[0]] and colors[[1]] will be blended using
/// the value returned by this function.
// ignore: non_constant_identifier_names
LinearGradient CurvedGradient({
  required Alignment begin,
  required Alignment end,
  required List<Color> colors,
  List<double> stops = const [0.0, 1.0],
  required int granularity,
  required double Function(double) curveGenerator,
}) {
  assert(granularity >= 2);
  assert(colors.length == 2);
  assert(stops.length == 2);
  assert(stops[0] >= 0 && stops[0] <= 1);
  assert(stops[1] >= 0 && stops[1] <= 1);
  assert(stops[0] <= stops[1]);
  var rawStops = List<double>.generate(
    granularity,
    (i) => i * 1.0 / (granularity - 1),
  );
  var mStops = rawStops.map((val) => stops[0] + val * (stops[1] - stops[0]));
  var mColors = rawStops.map((factor) {
    return blendColors(colors[0], colors[1], curveGenerator(factor));
  });
  return LinearGradient(
    colors: mColors.toList(),
    stops: mStops.toList(),
    begin: begin,
    end: end,
  );
}

Color blendColors(Color c1, Color c2, double factor) {
  return Color.fromARGB(
    blendNumbers(c1.alpha, c2.alpha, factor),
    blendNumbers(c1.red, c2.red, factor),
    blendNumbers(c1.green, c2.green, factor),
    blendNumbers(c1.blue, c2.blue, factor),
  );
}

int blendNumbers(int n1, int n2, double factor) {
  return (n1 * factor + n2 * (1.0 - factor)).round();
}
