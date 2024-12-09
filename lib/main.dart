import 'package:device_preview/device_preview.dart';
import 'package:final_task/src/core/routes/names.dart';
import 'package:final_task/src/core/routes/pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'src/core/config/config.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  //  Here we are calling the Dependency Injection
  await DependencyInjection.init();
  //  This is the main app
  runApp(
    DevicePreview(
      builder: (context) => const MyApp()
      ,enabled: true,
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, ch) => const DismissKeyboard(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesName.initial,
          onGenerateRoute: AppRoute.generate,
        ),
      ),
    );
  }
}
