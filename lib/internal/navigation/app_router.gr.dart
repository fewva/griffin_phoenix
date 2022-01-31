// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../models/role/irole.dart' as _i7;
import '../../presentation/shared/bottom_navigation.dart' as _i4;
import '../../presentation/shared/splash_screen.dart' as _i1;
import '../../presentation/views/lessons_view/lessons_view.dart' as _i3;
import '../../presentation/views/select_role_view/select_role_view.dart' as _i2;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      final args = routeData.argsAs<SplashScreenRouteArgs>(
          orElse: () => const SplashScreenRouteArgs());
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i1.SplashScreen(key: args.key, text: args.text),
          fullscreenDialog: true);
    },
    SelectRoleViewRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.SelectRoleView());
    },
    LessonsViewRoute.name: (routeData) {
      final args = routeData.argsAs<LessonsViewRouteArgs>();
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i3.LessonsView(key: args.key, role: args.role));
    },
    BottomNavigationRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.BottomNavigation());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(SplashScreenRoute.name, path: '/splash-screen'),
        _i5.RouteConfig(SelectRoleViewRoute.name, path: '/select-role-view'),
        _i5.RouteConfig(LessonsViewRoute.name, path: '/lessons-view'),
        _i5.RouteConfig(BottomNavigationRoute.name, path: '/')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i5.PageRouteInfo<SplashScreenRouteArgs> {
  SplashScreenRoute({_i6.Key? key, String? text})
      : super(SplashScreenRoute.name,
            path: '/splash-screen',
            args: SplashScreenRouteArgs(key: key, text: text));

  static const String name = 'SplashScreenRoute';
}

class SplashScreenRouteArgs {
  const SplashScreenRouteArgs({this.key, this.text});

  final _i6.Key? key;

  final String? text;

  @override
  String toString() {
    return 'SplashScreenRouteArgs{key: $key, text: $text}';
  }
}

/// generated route for
/// [_i2.SelectRoleView]
class SelectRoleViewRoute extends _i5.PageRouteInfo<void> {
  const SelectRoleViewRoute()
      : super(SelectRoleViewRoute.name, path: '/select-role-view');

  static const String name = 'SelectRoleViewRoute';
}

/// generated route for
/// [_i3.LessonsView]
class LessonsViewRoute extends _i5.PageRouteInfo<LessonsViewRouteArgs> {
  LessonsViewRoute({_i6.Key? key, required _i7.IRole role})
      : super(LessonsViewRoute.name,
            path: '/lessons-view',
            args: LessonsViewRouteArgs(key: key, role: role));

  static const String name = 'LessonsViewRoute';
}

class LessonsViewRouteArgs {
  const LessonsViewRouteArgs({this.key, required this.role});

  final _i6.Key? key;

  final _i7.IRole role;

  @override
  String toString() {
    return 'LessonsViewRouteArgs{key: $key, role: $role}';
  }
}

/// generated route for
/// [_i4.BottomNavigation]
class BottomNavigationRoute extends _i5.PageRouteInfo<void> {
  const BottomNavigationRoute() : super(BottomNavigationRoute.name, path: '/');

  static const String name = 'BottomNavigationRoute';
}
