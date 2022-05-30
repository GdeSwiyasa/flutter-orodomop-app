import 'package:hive_flutter/adapters.dart';
import 'package:orodomop_app/data/models/timer_pomodoro.dart';

Future<void> insertDefaultData() async {
  // await _insertDefaultProjects();
  await _insertDefaultPomodoroTimer();
  await _insertDefaultTheme();
  await _insertDefaultTimerTheme();
}

Future<void> _insertDefaultPomodoroTimer() async {
  final box = await Hive.openBox<PomodoroTimerModel>('pt_box');

  if (box.isEmpty) {
    final pomodoroTimer = PomodoroTimerModel.initial();
    await box.put('pt_box', pomodoroTimer);
  }
}

Future<void> _insertDefaultTheme() async {
  final box = await Hive.openBox<int>('theme_box');

  if (box.isEmpty) {
    await box.put('theme_box', 0);
  }
}

Future<void> _insertDefaultTimerTheme() async {
  final box = await Hive.openBox<int>('timer_theme_box');
  if (box.isEmpty) {
    await box.put('timer_theme_box', 0);
  }
}
