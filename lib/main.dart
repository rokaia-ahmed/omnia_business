import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omnia_business/core/utils/app_colors.dart';

import 'core/dependency_injection/injection.dart';
import 'core/network/local/cache/chace_helper.dart';
import 'core/network/remote/apis/dio_helper.dart';
import 'core/utils/app_locales.dart';
import 'featurse/splash/splash_screen.dart';
var navigatorKey = GlobalKey<NavigatorState>();
void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  /// screen util
  await ScreenUtil.ensureScreenSize();

  /// SHARED PREFERENCES INIT
  await CacheHelper.init();

  /// API INIT [DIO]
  DioHelper.init();

  /// GET IT
  GetItService.setupGitIt();

  /// LANGUAGE INIT
  await EasyLocalization.ensureInitialized();
  await AppLocales.init();
  /// firebase
 /* await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseNotifications.init();*/

  /// SET DISABLE AUTO ROTATE
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(EasyLocalization(
      path: AppLocales.path,
      supportedLocales: AppLocales.supportedLocales,
      startLocale: AppLocales.currentLocale,
      child: const MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393,852),
      splitScreenMode: true,
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        navigatorKey:navigatorKey,
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        theme: ThemeData(
          useMaterial3:true,
          scaffoldBackgroundColor: Colors.white,
          colorScheme: .fromSeed(seedColor: AppColors.primary),
        ),
        home: SplashScreen(),
      ),
    );
  }
}

