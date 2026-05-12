import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/text_styles.dart';


class CustomAppBar {
  static PreferredSizeWidget custom(context, String title) => AppBar(
    backgroundColor: Colors.white,
    titleSpacing: 0,
    surfaceTintColor: Colors.transparent,
    title: Text(
      title,
      style: TextStyles.textStyle12w700,
    ),
    leadingWidth: 35.w,
    leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios_new,size: 18,)),
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(1),
      child: Container(
        color: AppColors.borderColor,
        height: 1,
        width: double.infinity,
      ),
    ),
  );
}

