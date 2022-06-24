import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:orodomop_app/presentation/provider/timer_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'timer_provider_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late MockSharedPreferences mockSharedPreferences;
  late TimerProvider timerProvider;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    timerProvider = TimerProvider();
  });

  group('Save Data Test', () {
    test('Save Data Test', () async {
      when(timerProvider.breakDuration).thenReturn(1);
      when(timerProvider.focusDuration).thenReturn(1);
      when(timerProvider.numCycle).thenReturn(1);

      await timerProvider.saveData(
          breakDuration: 1, focusDuration: 1, numCycle: 1);

      expect(timerProvider.prefs.getInt('breakDuration'), 1);
      expect(timerProvider.prefs.getInt('focusDuration'), 1);
      expect(timerProvider.prefs.getInt('numCycle'), 1);
    });
  });
}
