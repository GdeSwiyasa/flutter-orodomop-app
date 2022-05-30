part of 'timer_pomodoro_cubit.dart';

enum PomodoroStatus {
  stopped,
  running,
  paused,
  completed,
}

extension TimerStatisExtension on PomodoroStatus {
  bool get isPaused => this == PomodoroStatus.paused;
  bool get isStopped => this == PomodoroStatus.stopped;
}

enum PomodoroMode {
  work,
  relax,
}

extension TimerModeExtension on PomodoroMode {
  bool get isWork => this == PomodoroMode.work;
  String get asString => toString().split('.').last;
}

class TimerState {
  final int duration;
  final int currentDuration;
  final PomodoroMode mode;
  final PomodoroStatus status;
  final int currentCycle;
  final PomodoroTimerModel pomodoroTimer;

  TimerState({
    required this.duration,
    required this.currentDuration,
    required this.mode,
    required this.status,
    required this.currentCycle,
    required this.pomodoroTimer,
  });

  factory TimerState.initial() {
    return TimerState(
      duration: 1,
      currentDuration: 0,
      mode: PomodoroMode.work,
      status: PomodoroStatus.stopped,
      currentCycle: 0,
      pomodoroTimer: PomodoroTimerModel.initial(),
    );
  }

  TimerState copyWith({
    int? duration,
    int? currentDuration,
    PomodoroMode? mode,
    PomodoroStatus? status,
    int? currentCycle,
    PomodoroTimerModel? pomodoroTimer,
  }) {
    return TimerState(
      duration: duration ?? this.duration,
      currentDuration: currentDuration ?? this.currentDuration,
      mode: mode ?? this.mode,
      status: status ?? this.status,
      currentCycle: currentCycle ?? this.currentCycle,
      pomodoroTimer: pomodoroTimer ?? this.pomodoroTimer,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TimerState &&
        other.duration == duration &&
        other.currentDuration == currentDuration &&
        other.mode == mode &&
        other.status == status &&
        other.currentCycle == currentCycle &&
        other.pomodoroTimer == pomodoroTimer;
  }

  @override
  int get hashCode =>
      duration.hashCode ^
      currentDuration.hashCode ^
      mode.hashCode ^
      status.hashCode ^
      currentCycle.hashCode ^
      pomodoroTimer.hashCode;
}
