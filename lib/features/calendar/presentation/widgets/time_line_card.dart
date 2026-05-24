import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omnia_business/core/utils/app_colors.dart';

class TimelineCard extends StatelessWidget {
  final String title;
  final String from;
  final String to;
  final String status;
  final Color statusColor;
  final Color lineColor;
  final Color backgroundStatus;

  const TimelineCard({
    super.key,
    required this.title,
    required this.from,
    required this.to,
    required this.status,
    required this.statusColor,
    required this.lineColor,
    required this.backgroundStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.fromLTRB(0, 0.h, 10.w, 0.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(3),
          bottomLeft:Radius.circular(3),
          bottomRight:Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 3.w,
            height: 84.h,
            decoration: BoxDecoration(
              color: lineColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

           SizedBox(width: 12.w),

          Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style:  TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      Container(
                        padding:  EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: backgroundStatus,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          status,
                          style: TextStyle(
                            color: statusColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),

                   SizedBox(height: 12.h),

                  Row(
                    children: [
                      Text(
                        "From $from",
                        style:  TextStyle(
                          color: AppColors.grey1Color,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        "To $to",
                        style:  TextStyle(
                            color: AppColors.grey1Color,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}