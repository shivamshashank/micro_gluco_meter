import 'package:flutter/cupertino.dart';
import 'package:micro_gluco_meter/main.dart';
import 'package:micro_gluco_meter/screens/graphs_screen.dart';
import 'package:micro_gluco_meter/screens/records_screen.dart';
import 'package:micro_gluco_meter/screens/region_of_interest_screen.dart';
import 'package:micro_gluco_meter/screens/register_screen.dart';
import 'package:micro_gluco_meter/screens/reports_screen.dart';
import 'package:micro_gluco_meter/screens/splash_screen.dart';
import 'package:micro_gluco_meter/screens/upload_image_screen.dart';

class Routes {
  static const String splashScreen = '/splashScreen';
  static const String registerScreen = '/registerScreen';
  static const String recordsScreen = '/recordsScreen';
  static const String uploadImageScreen = '/uploadImageScreen';
  static const String regionOfInterestScreen = '/regionOfInterestScreen';
  static const String reportsScreen = '/reportsScreen';
  static const String graphsScreen = '/graphsScreen';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return CupertinoPageRoute(builder: (_) => const SplashScreen());
      case Routes.registerScreen:
        return CupertinoPageRoute(builder: (_) => const RegisterScreen());
      case Routes.recordsScreen:
        return CupertinoPageRoute(builder: (_) => const RecordScreen());
      case Routes.uploadImageScreen:
        return CupertinoPageRoute(builder: (_) => const UploadImageScreen());
      case Routes.regionOfInterestScreen:
        final args = settings.arguments as RegionOfInterestArguments;
        return CupertinoPageRoute(
          builder: (_) => RegionOfInterestScreen(
            regionOfInterestArguments: args,
          ),
        );
      case Routes.reportsScreen:
        final args = settings.arguments as ReportsArguments;
        return CupertinoPageRoute(
          builder: (_) => ReportsScreen(
            reportsArguments: args,
          ),
        );
      case Routes.graphsScreen:
        return CupertinoPageRoute(builder: (_) => const GraphsScreen());

      default:
        return CupertinoPageRoute(builder: (_) => const MyApp());
    }
  }
}
