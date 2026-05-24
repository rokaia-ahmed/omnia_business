import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omnia_business/core/utils/app_colors.dart';

class TopTitle extends StatelessWidget {
  const TopTitle({super.key, required this.title});
  final String title ;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.arrow_back_ios,
          color: AppColors.textColor,
        ),
        SizedBox(width: 8.w,),
        Text(title,
        style: TextStyle(
           fontSize: 24,
          color: AppColors.textColor,
          fontWeight: FontWeight.w600
        ),
        ),
      ],
    );
  }
}
