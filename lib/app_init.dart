import 'package:apicallwithbloc/dependency_injection.dart';

class AppInit {
  static Future<void> initialize() async {
    await initDependencyInjection();
  }
}
