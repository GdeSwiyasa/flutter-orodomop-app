import 'package:flutter/material.dart';

import 'package:orodomop_app/common/utils.dart';

import 'package:orodomop_app/presentation/provider/navigation_provider.dart';
import 'package:orodomop_app/presentation/provider/notes_db_provider.dart';
import 'package:orodomop_app/presentation/provider/timer_provider.dart';

import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void initState() {}
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => NotesDatabaseProvider()),
        ChangeNotifierProvider(create: (_) => TimerProvider()),
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
