import 'package:flutter/material.dart';
import 'package:orodomop_app/common/utils.dart';
import 'package:orodomop_app/presentation/pages/main_view.dart';
import 'package:orodomop_app/presentation/pages/onboarding_screen.dart';
import 'package:orodomop_app/presentation/provider/navigation_provider.dart';
import 'package:orodomop_app/presentation/provider/notes_db_provider.dart';
import 'package:orodomop_app/presentation/provider/timer_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? showHome;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences pref = await SharedPreferences.getInstance();
  showHome = pref.getBool('showHome') ?? false;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
            home: showHome == true ? MainView() : OnBoardingScreen(),
          );
        },
      ),
    );
  }
}
