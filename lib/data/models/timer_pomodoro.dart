import 'package:hive/hive.dart';

part 'timer_pomodoro.g.dart';

@HiveType(typeId: 3)
class PomodoroTimerModel {
  @HiveField(0)
  final int productiveTime;
  @HiveField(1)
  final int shortBreakTime;
  @HiveField(2)
  final int longBreakTime;
  @HiveField(3)
  final int longInterval;
  @HiveField(4)
  final int workCycle;
  // @HiveField(5)
  // final bool notify;
  // @HiveField(6)
  // final bool autoStart;

  PomodoroTimerModel({
    required this.productiveTime,
    required this.shortBreakTime,
    required this.longBreakTime,
    required this.longInterval,
    required this.workCycle,
    // required this.notify,
    // required this.autoStart,
  });

  factory PomodoroTimerModel.initial() {
    return PomodoroTimerModel(
      productiveTime: 1,
      shortBreakTime: 5,
      longBreakTime: 15,
      longInterval: 3,
      workCycle: 4,
      // notify: true,
      // autoStart: true,
    );
  }

  PomodoroTimerModel copyWith({
    int? workTime,
    int? shortBreakTime,
    int? longBreakTime,
    int? longInterval,
    int? workCycle,
    // bool? notify,
    // bool? autoStart,
  }) {
    return PomodoroTimerModel(
      productiveTime: workTime ?? this.productiveTime,
      shortBreakTime: shortBreakTime ?? this.shortBreakTime,
      longBreakTime: longBreakTime ?? this.longBreakTime,
      longInterval: longInterval ?? this.longInterval,
      workCycle: workCycle ?? this.workCycle,
      // notify: notify ?? this.notify,
      // autoStart: autoStart ?? this.autoStart,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PomodoroTimerModel &&
        other.productiveTime == productiveTime &&
        other.shortBreakTime == shortBreakTime &&
        other.longBreakTime == longBreakTime &&
        other.longInterval == longInterval &&
        other.workCycle == workCycle;
    // other.notify == notify &&
    // other.autoStart == autoStart;
  }

  @override
  int get hashCode {
    return productiveTime.hashCode ^
        shortBreakTime.hashCode ^
        longBreakTime.hashCode ^
        longInterval.hashCode ^
        workCycle.hashCode;
    // notify.hashCode ^
    // autoStart.hashCode;
  }
}
