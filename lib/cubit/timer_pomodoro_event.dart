import 'package:orodomop_app/cubit/timer_pomodoro_cubit.dart';

abstract class TimerPomodoroEvent {}

class TimerStartedEvent extends TimerPomodoroEvent {}

class TimerPausedEvent extends TimerPomodoroEvent {}

class TimerResumedEvent extends TimerPomodoroEvent {}

class TimerStoppedEvent extends TimerPomodoroEvent {}

class TimerCycleCompletedEvent extends TimerPomodoroEvent {
  final PomodoroMode mode;
  final int duration;

  TimerCycleCompletedEvent({
    required this.mode,
    required this.duration,
  });
}

class TimerCompletedEvent extends TimerPomodoroEvent {}
