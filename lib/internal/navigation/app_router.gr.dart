// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

import '../../presentation/views/select_role_view/select_role_view.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    SelectRoleViewRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData,
          child: const _i1.SelectRoleView(),
          fullscreenDialog: true);
    }
  };

  @override
  List<_i2.RouteConfig> get routes =>
      [_i2.RouteConfig(SelectRoleViewRoute.name, path: '/')];
}

/// generated route for
/// [_i1.SelectRoleView]
class SelectRoleViewRoute extends _i2.PageRouteInfo<void> {
  const SelectRoleViewRoute() : super(SelectRoleViewRoute.name, path: '/');

  static const String name = 'SelectRoleViewRoute';
}
