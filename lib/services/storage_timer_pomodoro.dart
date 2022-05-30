import 'package:hive/hive.dart';
import 'package:orodomop_app/data/models/timer_pomodoro.dart';

class StoragePomodoroTimer {
  late final Box<PomodoroTimerModel> _box;

  Future<void> init() async {
    _box = await Hive.openBox<PomodoroTimerModel>('pt_box');
  }

  PomodoroTimerModel getPomodoroTimer() {
    return _box.get('pt_box')!;
  }

  Future<void> savePomodoroTimer(PomodoroTimerModel pomodoroTimer) async {
    await _box.put('pt_box', pomodoroTimer);
  }
}
