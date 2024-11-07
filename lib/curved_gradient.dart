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

  final stopDifference = stops[1] - stops[0];
  final mStops = List<double>.filled(granularity, 0.0);
  final mColors = List<Color>.filled(granularity, colors[0]);

  for (int i = 0; i < granularity; i++) {
    final factor = i / (granularity - 1);
    mStops[i] = stops[0] + factor * stopDifference;
    mColors[i] = Color.lerp(colors[1], colors[0], curveGenerator(factor))!;
  }

  return LinearGradient(
    colors: mColors,
    stops: mStops,
    begin: begin,
    end: end,
  );
}

