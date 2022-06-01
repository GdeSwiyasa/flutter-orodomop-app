import 'package:flutter/cupertino.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class TimerProvider extends ChangeNotifier {
  final CountDownController _controller = CountDownController();
  CountDownController get controller => _controller;

  bool _focusStatus = true;
  bool get focusStatus => _focusStatus;
  set focusStatus(bool value) {
    _focusStatus = value;
  }

  int _breakDuration = 2;
  int get breakDuration => _breakDuration;

  int _focusDuration = 5;
  int get focusDuration => _focusDuration;

  int _cycle = 2 * 2;
  set cycle(int value) {
    _cycle = value;
  }

  int get cycle => _cycle;

  void startTimerFocus() async {
    _controller.start();
  }

  void pauseTimer() {
    _controller.pause();
  }

  void resumeTimer() {
    _controller.resume();
  }

  void restartTimer(int duration) async {
    _controller.restart(duration: duration);
  }
}
