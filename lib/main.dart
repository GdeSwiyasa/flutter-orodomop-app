import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:orodomop_app/common/dark_theme.dart';
import 'package:orodomop_app/common/utils.dart';
import 'package:orodomop_app/presentation/provider/quote_list_notifier.dart';
import 'package:orodomop_app/presentation/pages/main_view.dart';
import 'package:orodomop_app/presentation/pages/onboarding_screen.dart';
import 'package:orodomop_app/presentation/provider/dark_theme_provider.dart';
import 'package:orodomop_app/presentation/provider/navigation_provider.dart';
import 'package:orodomop_app/presentation/provider/notes_db_provider.dart';
import 'package:orodomop_app/presentation/provider/timer_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'injection.dart' as di;

bool? showHome;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  showHome = pref.getBool('showHome') ?? false;
  di.init();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('id')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      child: Phoenix(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = di.locator<DarkThemeProvider>();

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
        ChangeNotifierProvider(create: (_) => di.locator<NavigationProvider>()),
        ChangeNotifierProvider(
            create: (_) => di.locator<NotesDatabaseProvider>()),
        ChangeNotifierProvider(create: (_) => di.locator<TimerProvider>()),
        ChangeNotifierProvider(create: (_) => di.locator<QuoteListNotifier>()),
        ChangeNotifierProvider(create: (_) => themeChangeProvider),
      ],
      child: Consumer<DarkThemeProvider>(
          builder: (BuildContext context, value, child) {
        return MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: Styles.themeData(themeChangeProvider.darkTheme, context),
          navigatorObservers: [routeObserver],
          onGenerateRoute: NavigationProvider.of(context).onGenerateRoute,
          home: showHome == true ? const MainView() : const OnBoardingScreen(),
        );
      }),
    );
  }
}
