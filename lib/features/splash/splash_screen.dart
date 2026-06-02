import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omnia_business/core/network/local/cache/chace_helper.dart';
import 'package:omnia_business/core/utils/app_images.dart';
import 'package:omnia_business/features/layout/presentation/screens/layout_screen.dart';
import '../../core/utils/app_navigation.dart';
import '../login/presentation/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3),
            (){
              AppNavigator.replace(screen: CacheHelper.getData('token') !=null?
              LayoutScreen():LoginScreen(), context: context);
        }
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: SvgPicture.asset(AppSvg.logo)),
    );
  }
}
