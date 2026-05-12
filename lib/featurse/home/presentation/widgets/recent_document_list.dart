import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omnia_business/core/utils/app_colors.dart';
import 'package:omnia_business/core/utils/app_images.dart';

class RecentDocumentList extends StatelessWidget {
  const RecentDocumentList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        separatorBuilder: (_, __) =>  SizedBox(height: 10.h),
        itemBuilder: (context, i) => _DocumentTile());
  }
}


class _DocumentTile extends StatelessWidget {

  const _DocumentTile();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.fillColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // PDF Icon
          Container(
            width: 56.w,
            height: 56.h,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(AppSvg.pdf,fit: BoxFit.none,),
          ),
           SizedBox(width: 12.w),
          // Name + meta
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'doc name.pdf',
                  style:  TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                 SizedBox(height: 8.h),
                Row(
                  children: [
                    Text(
                      'Added 3 hours',
                      style:
                       TextStyle(
                         color: AppColors.grey1Color,
                          fontSize: 14.sp,
                         fontWeight: FontWeight.w500,
                       ),
                    ),
                     SizedBox(width: 6.w),
                    Container(
                      width: 8.w,
                      height: 8.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary,
                      ),
                    ),
                     SizedBox(width: 6.w),
                    Text(
                      '200 MG',
                      style:
                       TextStyle(
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
          // More icon
        //  const Icon(Icons.more_vert, color: kTextGrey, size: 20),
        ],
      ),
    );
  }
}