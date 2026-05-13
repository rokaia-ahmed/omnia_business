import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';

class HistoryTitleRow extends StatelessWidget {
  const HistoryTitleRow({super.key, required this.title1, required this.title2});
   final String title1 ;
   final String title2;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title1,
          style:  TextStyle(
            fontSize: 18.sp,
            color: AppColors.textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          title2,
          style:  TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
