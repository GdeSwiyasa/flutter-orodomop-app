import 'package:flutter_test/flutter_test.dart';
import 'package:orodomop_app/presentation/provider/timer_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
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
          timerProvider.saveData(
              breakDuration: 1, focusDuration: 0, numCycle: 0);

          await timerProvider.loadTimer();

          expect(timerProvider.breakDuration, 1);
        },
      );

      test(
        'focusDuration should contain 1 after saving',
        () async {
          timerProvider.saveData(
              breakDuration: 0, focusDuration: 1, numCycle: 0);

          await timerProvider.loadTimer();

          expect(timerProvider.focusDuration, 1);
        },
      );

      test(
        'numCycle should contain 1 after saving',
        () async {
          timerProvider.saveData(
              breakDuration: 0, focusDuration: 0, numCycle: 1);

          await timerProvider.loadTimer();

          expect(timerProvider.numCycle, 1);
        },
      );
    },
  );
}
