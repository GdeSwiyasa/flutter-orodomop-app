import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:orodomop_app/core/ticker.dart';

import 'package:equatable/equatable.dart';
import 'package:orodomop_app/cubit/timer_pomodoro_event.dart';
import 'package:orodomop_app/data/models/timer_pomodoro.dart';
import 'package:orodomop_app/services/storage_timer_pomodoro.dart';

part 'timer_pomodoro_state.dart';

class TimerPomodoroCubit extends Cubit<TimerState> {
  TimerPomodoroCubit() : super(TimerState.initial());

  late final Ticker _ticker;
  StreamSubscription<int>? _tickerSubscription;
  late final StoragePomodoroTimer _storagePomodoroTimer;

  late final StreamController<TimerPomodoroEvent> _streamController;
  Stream<TimerPomodoroEvent> get timerStream => _streamController.stream;

  void init() async {
    _ticker = Ticker();
    _streamController = StreamController<TimerPomodoroEvent>.broadcast();

    _storagePomodoroTimer = StoragePomodoroTimer();
    await _storagePomodoroTimer.init();

    setPomodoroTimer(_storagePomodoroTimer.getPomodoroTimer());
  }

  void setPomodoroTimer(PomodoroTimerModel pomodoroTimer) {
    final duration = pomodoroTimer.productiveTime * 60;
    emit(
      state.copyWith(
        duration: duration,
        currentDuration: duration,
        pomodoroTimer: pomodoroTimer,
      ),
    );
  }

  void start() async {
    _tickerSubscription = _ticker
        .tick(ticks: state.duration)
        .listen(_mapTickerEventToState)
      ..resume();

    emit(
      state.copyWith(
        status: PomodoroStatus.running,
      ),
    );

    _streamController.add(TimerStartedEvent());
  }

  void resume() {
    _tickerSubscription?.resume();

    emit(
      state.copyWith(
        status: PomodoroStatus.running,
      ),
    );

    _streamController.add(TimerResumedEvent());
  }

  void pause() {
    _tickerSubscription?.pause();

    emit(
      state.copyWith(
        status: PomodoroStatus.paused,
      ),
    );

    _streamController.add(TimerPausedEvent());
  }

  void nextCycle() {
    _tickerSubscription?.cancel();

    _streamController.add(
      TimerCycleCompletedEvent(
        mode: state.mode,
        duration: state.duration,
      ),
    );

    if (state.currentCycle >= state.pomodoroTimer.workCycle * 2 - 1) {
      _timerCompleted();
      return;
    }

    final mode = state.mode.isWork ? PomodoroMode.relax : PomodoroMode.work;
    final cycle = state.currentCycle + 1;
    final duration = _getDuration(mode, cycle);

    emit(
      state.copyWith(
        mode: mode,
        status: PomodoroStatus.paused,
        currentCycle: cycle,
        duration: duration,
        currentDuration: duration,
      ),
    );

    _tickerSubscription = _ticker
        .tick(ticks: state.duration)
        .listen(_mapTickerEventToState)
      ..pause();

    // if (state.pomodoroTimer.autoStart) {
    //   _tickerSubscription?.resume();
    //   emit(state.copyWith(status: PomodoroStatus.running));
    // }
  }

  void stop() {
    _tickerSubscription?.cancel();

    final duration = state.pomodoroTimer.productiveTime * 60;

    emit(
      state.copyWith(
        duration: duration,
        status: PomodoroStatus.stopped,
        currentDuration: duration,
      ),
    );

    _streamController.add(TimerStoppedEvent());
  }

  void _mapTickerEventToState(int event) {
    if (event > 0) {
      emit(
        state.copyWith(
          status: PomodoroStatus.running,
          currentDuration: event,
        ),
      );
    } else {
      nextCycle();
    }
  }

  void _timerCompleted() {
    _tickerSubscription?.cancel();

    final duration = state.pomodoroTimer.productiveTime * 60;

    emit(
      state.copyWith(
        duration: duration,
        status: PomodoroStatus.stopped,
        mode: PomodoroMode.work,
        currentDuration: duration,
      ),
    );

    _streamController.add(TimerCompletedEvent());
  }

  int _getDuration(PomodoroMode mode, int cycle) {
    if (mode.isWork) {
      return state.pomodoroTimer.productiveTime * 60;
    }

    if (cycle ~/ 2 % state.pomodoroTimer.longInterval == 0) {
      return state.pomodoroTimer.longBreakTime * 60;
    }

    return state.pomodoroTimer.shortBreakTime * 60;
  }
}
