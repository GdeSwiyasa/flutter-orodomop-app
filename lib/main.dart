import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:orodomop_app/common/utils.dart';

import 'package:orodomop_app/core/hive_default_data.dart';
import 'package:orodomop_app/cubit/timer_pomodoro_cubit.dart';
import 'package:orodomop_app/data/models/timer_pomodoro.dart';

import 'package:orodomop_app/presentation/provider/navigation_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  registerAllHiveApadters();
  await insertDefaultData();
  // MyApp(),
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void initState() {}
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        BlocProvider<TimerPomodoroCubit>(
          create: (_) => TimerPomodoroCubit()..init(),
        ),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            navigatorObservers: [routeObserver],
            debugShowCheckedModeBanner: false,
            onGenerateRoute: NavigationProvider.of(context).onGenerateRoute,
          );
        },
      ),
    );
  }
}

void registerAllHiveApadters() {
  Hive.registerAdapter(AdapterTimerPomodoro());
}
