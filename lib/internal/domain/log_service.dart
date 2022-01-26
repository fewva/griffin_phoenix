import 'package:griffin_phoenix/internal/utils/debug_print.dart';

class LogService {
  static void handleError(var e) => printError(e);

  static void logEvent(var data) => printWarning(data);
}
