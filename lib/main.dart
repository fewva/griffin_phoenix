import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:get_storage/get_storage.dart';
import 'package:griffin_phoenix/internal/constants/constants.dart';
import 'package:griffin_phoenix/internal/locator.dart';
import 'package:griffin_phoenix/internal/navigation/app_router.gr.dart';
import 'package:griffin_phoenix/theme/app_colors.dart';

Future<void> main() async {
  await setupLocator();
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await FlutterDisplayMode.setHighRefreshRate();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ru')],
      fallbackLocale: const Locale('ru'),
      path: 'assets/translations',
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: Constants.appTitle,
      theme: ThemeData(
        fontFamily: Constants.font,
        primarySwatch: Colors.lightGreen,
        scaffoldBackgroundColor: AppColors.white,
        backgroundColor: AppColors.white,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.green,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
        ),
        textTheme: TextTheme(
          headline6: TextStyle(
            fontSize: 20,
            color: AppColors.green,
            fontWeight: FontWeight.w600,
          ),
          caption: const TextStyle(
            fontSize: 13,
            height: 15.9 / 13,
            color: AppColors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
        cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
          primaryColor: AppColors.green,
        ),
        primaryTextTheme: TextTheme(button: TextStyle(color: Colors.yellow)),
        appBarTheme: AppBarTheme(
          elevation: 2,
          shadowColor: AppColors.shadowColor.withOpacity(0.3),
          backgroundColor: AppColors.white,
          iconTheme: const IconThemeData(
            color: AppColors.black,
          ),
          actionsIconTheme: const IconThemeData(
            color: AppColors.black,
          ),
          titleTextStyle: const TextStyle(
            fontFamily: Constants.font,
            fontSize: 20,
            height: 24 / 20,
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        colorScheme: const ColorScheme.light(
          primary: AppColors.green,
          onSurface: AppColors.blackText,
          onSecondary: AppColors.blackText,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: Constants.font,
        scaffoldBackgroundColor: AppColors.blackText,
        colorScheme: ColorScheme.dark(
          primary: AppColors.greenDark,
          onSurface: AppColors.white.withOpacity(0.87),
          // onPrimary: AppColors.white.withOpacity(0.87),
        ),
        // scaffoldBackgroundColor: const Color(0xff121212),
        // scaffoldBackgroundColor: const Color(0xff15141e),
        backgroundColor: const Color(0xff121212),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.white70),
          headline6: TextStyle(
            fontSize: 20,
            color: AppColors.greenDark,
            fontWeight: FontWeight.w600,
          ),
          caption: const TextStyle(
            fontSize: 13,
            height: 15.9 / 13,
            fontWeight: FontWeight.w600,
            color: Colors.white60,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.blackText,
          selectedItemColor: AppColors.green,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 2,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 2,
          backgroundColor: AppColors.blackText,
        ),
      ),
    );
  }
}
