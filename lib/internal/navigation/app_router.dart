import 'package:auto_route/annotations.dart';
import 'package:griffin_phoenix/presentation/views/select_role_view/select_role_view.dart';

@AdaptiveAutoRouter(
  preferRelativeImports: true,
  routes: [
    AutoRoute(
      initial: true,
      fullscreenDialog: true,
      page: SelectRoleView,
    ),
  ],
)
class $AppRouter {} 

// flutter packages pub run build_runner build