import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

abstract class TimerPomodoroSlider extends StatelessWidget {
  const TimerPomodoroSlider({
    Key? key,
    required this.value,
    required this.color,
  }) : super(key: key);

  final double value;
  final Color color;

  @override
  Widget build(BuildContext context);
}

class PomodoroTimerSlider extends TimerPomodoroSlider {
  const PomodoroTimerSlider({
    Key? key,
    required double value,
    required Color color,
  }) : super(
          key: key,
          value: value,
          color: color,
        );

  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
      axes: [
        RadialAxis(
          startAngle: 270,
          endAngle: 270,
          minimum: 0,
          maximum: 1,
          showLabels: false,
          showTicks: false,
          axisLineStyle: AxisLineStyle(
            thickness: 15,
            color: color.withOpacity(0.5),
          ),
          pointers: [
            MarkerPointer(
              value: 0,
              markerWidth: 15,
              markerHeight: 15,
              markerType: MarkerType.circle,
              color: color,
            ),
            RangePointer(
              value: value,
              width: 15,
              color: color,
              enableAnimation: true,
              animationType: AnimationType.linear,
            ),
            MarkerPointer(
              value: value,
              markerWidth: 15,
              markerHeight: 15,
              markerType: MarkerType.circle,
              enableAnimation: true,
              animationType: AnimationType.linear,
              color: color,
            ),
          ],
        )
      ],
    );
  }
}

// Widget getTimerWidget({
//   Key? key,
//   required Color color,
//   required double value,
//   // // required int widgetIndex,
// }) {
//   // switch (widgetIndex) {
//   //   case 0:
//   return _TimerSliderTheme1(
//     key: key,
//     color: color,
//     value: value,
//   );
//   //   default:
//   //     return Container();
//   // }
// }
