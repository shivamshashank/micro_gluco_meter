import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:micro_gluco_meter/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: () => MaterialApp(
        title: 'Micro Gluco Meter',
        theme: ThemeData(
          primaryColor: Colors.blue,
          fontFamily: 'RobotoMono',
          textSelectionTheme: const TextSelectionThemeData(
            selectionHandleColor: Colors.blue,
          ),
        ),
        builder: (context, widget) {
          ScreenUtil.setContext(context);
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget ?? Container(),
          );
        },
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
