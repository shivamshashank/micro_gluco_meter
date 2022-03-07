import 'package:flutter/cupertino.dart';
import 'package:micro_gluco_meter/main.dart';
import 'package:micro_gluco_meter/screens/register_screen.dart';
import 'package:micro_gluco_meter/screens/splash_screen.dart';
import 'package:micro_gluco_meter/screens/upload_image_screen.dart';

class Routes {
  static const String splashScreen = '/splashScreen';
  static const String registerScreen = '/registerScreen';
  static const String uploadImageScreen = '/uploadImageScreen';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return CupertinoPageRoute(builder: (_) => const SplashScreen());
      case Routes.registerScreen:
        return CupertinoPageRoute(builder: (_) => const RegisterScreen());
      case Routes.uploadImageScreen:
        return CupertinoPageRoute(builder: (_) => const UploadImageScreen());

      default:
        return CupertinoPageRoute(builder: (_) => const MyApp());
    }
  }
}
