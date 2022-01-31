import 'package:auto_route/annotations.dart';
import 'package:griffin_phoenix/presentation/shared/bottom_navigation.dart';
import 'package:griffin_phoenix/presentation/shared/splash_screen.dart';
import 'package:griffin_phoenix/presentation/views/lessons_view/lessons_view.dart';
import 'package:griffin_phoenix/presentation/views/select_role_view/select_role_view.dart';

@AdaptiveAutoRouter(
  preferRelativeImports: true,
  routes: [
    AutoRoute(initial: false, fullscreenDialog: true, page: SplashScreen),
    AutoRoute(
      initial: false,
      page: SelectRoleView,
    ),
    AutoRoute(
      initial: false,
      page: LessonsView,
    ),
    AutoRoute(
      initial: true,
      page: BottomNavigation,
    ),
  ],
)
class $AppRouter {}

// flutter packages pub run build_runner build --delete-conflicting-outputs
