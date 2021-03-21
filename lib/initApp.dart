import 'package:challenge/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    );

    return ScreenUtilInit(
      designSize: Size(360, 699),
      allowFontScaling: true,
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        enableLog: true,
        initialRoute: AppPages.INITIAL,
        defaultTransition: Transition.zoom,
        getPages: AppPages.routes,
      ),
    );
  }
}
