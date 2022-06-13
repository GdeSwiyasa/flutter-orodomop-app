import 'package:flutter/cupertino.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimerProvider extends ChangeNotifier {
  late SharedPreferences prefs;

  final CountDownController _controller = CountDownController();
  CountDownController get controller => _controller;

  bool _focusStatus = true;
  bool get focusStatus => _focusStatus;

  set focusStatus(bool value) {
    _focusStatus = value;
  }

  int _breakDuration = 0;
  int get breakDuration => _breakDuration;
  set breakDuration(int value) {
    _breakDuration = value;
  }

  int _focusDuration = 0;
  int get focusDuration => _focusDuration;
  set focusDuration(int value) {
    _focusDuration = value;
  }

  int _numCycle = 0;
  int get numCycle => _numCycle;
  set numCycle(int value) {
    _numCycle = value;
  }

  int _breakDurationToMinute = 0;
  int get breakDurationToMinute => _breakDurationToMinute;

  int _focusDurationToMinute = 0;
  int get focusDurationToMinute => _focusDurationToMinute;

  Future<void> saveData({breakDuration, focusDuration, numCycle}) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setInt('breakDuration', breakDuration);
    prefs.setInt('focusDuration', focusDuration);
    prefs.setInt('numCycle', numCycle);
    notifyListeners();
  }

  Future<void> loadTimer() async {
    prefs = await SharedPreferences.getInstance();
    _breakDuration = prefs.getInt('breakDuration') ?? 2;
    _focusDuration = prefs.getInt('focusDuration') ?? 2;
    _breakDurationToMinute = _breakDuration * 60;
    _focusDurationToMinute = _focusDuration * 60;
    _numCycle = prefs.getInt('numCycle') ?? 2;
    _cycle = _numCycle * 2;
    focusStatus = true;
    notifyListeners();
  }

  int _cycle = 0;
  int get cycle => _cycle;
  set cycle(int value) {
    _cycle = value;
  }

  void startTimerFocus() async {
    focusStatus = true;
    _controller.start();
    notifyListeners();
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
