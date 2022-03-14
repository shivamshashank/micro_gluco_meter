import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:micro_gluco_meter/models/record_model.dart';
import 'package:micro_gluco_meter/providers/user_provider.dart';
import 'package:micro_gluco_meter/utils/routes.dart';
import 'package:micro_gluco_meter/widgets/app_theme_data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  Directory directory = await getApplicationDocumentsDirectory();
  Hive
    ..init(directory.path)
    ..registerAdapter(RecordModelAdapter());

  await Hive.openBox('box');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: () => MaterialApp(
          title: 'Micro Gluco Meter',
          theme: appThemeData(),
          builder: (context, widget) {
            ScreenUtil.setContext(context);
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget ?? Container(),
            );
          },
          initialRoute: Routes.splashScreen,
          onGenerateRoute: RouteGenerator.generateRoute,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
