import 'package:flutter/material.dart';
import 'package:orodomop_app/common/dark_theme.dart';
import 'package:orodomop_app/common/utils.dart';
import 'package:orodomop_app/presentation/pages/main_view.dart';
import 'package:orodomop_app/presentation/pages/onboarding_screen.dart';
import 'package:orodomop_app/presentation/provider/dark_theme_provider.dart';
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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreferences.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => NotesDatabaseProvider()),
        ChangeNotifierProvider(create: (_) => TimerProvider()),
        ChangeNotifierProvider(create: (_) => themeChangeProvider),
      ],
      child: Consumer<DarkThemeProvider>(
          builder: (BuildContext context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: Styles.themeData(themeChangeProvider.darkTheme, context),
          navigatorObservers: [routeObserver],
          onGenerateRoute: NavigationProvider.of(context).onGenerateRoute,
          home: showHome == true ? MainView() : OnBoardingScreen(),
        );
      }),
    );
  }
}
