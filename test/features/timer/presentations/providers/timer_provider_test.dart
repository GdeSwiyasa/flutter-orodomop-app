import 'package:flutter_test/flutter_test.dart';
import 'package:orodomop_app/presentation/provider/timer_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late SharedPreferences prefs;
  late TimerProvider timerProvider;

  setUp(
    () {
      timerProvider = TimerProvider();
    },
  );

  group(
    'Save data test',
    () {
      test(
        'breakDuration should contain 1 after saving',
        () async {
          await timerProvider.saveData(
              breakDuration: 1, focusDuration: 0, numCycle: 0);

          prefs = await SharedPreferences.getInstance();

          expect(prefs.getInt('breakDuration'), 1);
        },
      );

      test(
        'focusDuration should contain 1 after saving',
        () async {
          await timerProvider.saveData(
              breakDuration: 0, focusDuration: 1, numCycle: 0);

          prefs = await SharedPreferences.getInstance();

          expect(prefs.getInt('focusDuration'), 1);
        },
      );

      test(
        'numCycle should contain 1 after saving',
        () async {
          await timerProvider.saveData(
              breakDuration: 0, focusDuration: 0, numCycle: 1);

          prefs = await SharedPreferences.getInstance();

          expect(prefs.getInt('numCycle'), 1);
        },
      );
    },
  );
}
