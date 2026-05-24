import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omnia_business/core/utils/app_colors.dart';
import 'package:omnia_business/core/utils/app_images.dart';

class HomeTopHeader extends StatelessWidget {
  const HomeTopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: AppColors.fillColor,
        borderRadius: BorderRadius.circular(30),
      ),
      padding:  EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(AppSvg.logo,
          height: 41.h,
          ),
          // Bell icon
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: SvgPicture.asset(AppIcons.notification,),
           ),
        ],
      ),
    );
  }
}
