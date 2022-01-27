import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:get_storage/get_storage.dart';
import 'package:griffin_phoenix/internal/constants/constants.dart';
import 'package:griffin_phoenix/internal/domain/services/lessons/i_lessons_service.dart';
import 'package:griffin_phoenix/internal/domain/services/select_role/i_select_role_service.dart';
import 'package:griffin_phoenix/internal/navigation/app_router.gr.dart';
import 'package:griffin_phoenix/internal/utils/debug_print.dart';
import 'package:griffin_phoenix/models/role/group/group.dart';
import 'package:griffin_phoenix/root/container/init.dart';
import 'package:griffin_phoenix/root/container/root_container.dart';
import 'package:griffin_phoenix/theme/app_colors.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await FlutterDisplayMode.setHighRefreshRate();

  final directory = await getApplicationDocumentsDirectory();

  Hive.init(directory.path);

  final schedulesBox = await Hive.openLazyBox('schedules');

  final savedRoles = await Hive.openLazyBox('saved_roles');

  await schedulesBox.put(
    'group',
    const Group(
      id: 12312,
      course: 3,
      facultyid: 2,
      name: 'ИБ-1802',
      specialtyid: 2132,
    ).toJson(),
  );

  final gett = await schedulesBox.get('group');
  printWarning('get: $gett');

  final RootContainer container = await initContainer();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ru')],
      fallbackLocale: const Locale('ru'),
      path: 'assets/translations',
      child: MyApp(container: container),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
    required this.container,
  }) : super(key: key);

  final RootContainer container;

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ISelectRoleService>.value(value: container.iSelectRoleService),
        Provider<ILessonsService>.value(value: container.iLessonsService),
      ],
      child: MaterialApp.router(
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
          textTheme: const TextTheme(
            headline6: TextStyle(
              fontSize: 20,
              color: AppColors.green,
              fontWeight: FontWeight.w600,
            ),
            caption: TextStyle(
              fontSize: 13,
              height: 15.9 / 13,
              color: AppColors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
          cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
            primaryColor: AppColors.green,
          ),
          primaryTextTheme:
              const TextTheme(button: TextStyle(color: Colors.yellow)),
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
            caption: TextStyle(
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
      ),
    );
  }
}
