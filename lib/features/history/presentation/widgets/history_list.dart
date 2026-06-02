import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omnia_business/core/utils/app_colors.dart';
import 'package:omnia_business/features/history/logic/history_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
class HistoryList extends StatelessWidget {
  final HistoryCubit cubit ;
  final HistoryState state ;
  const HistoryList({super.key, required this.cubit, required this.state});

  @override
  Widget build(BuildContext context) {
    bool loading = false ;
    if(state is HistoryLoading){
      loading = true ;
    }else if(state is HistoryError){
      return SizedBox();
    }
    return Skeletonizer(
      enabled: loading,
      child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 2,
          separatorBuilder: (_, _) =>  SizedBox(height: 20.h),
          itemBuilder: (context, i) => HistoryCard()),
    );
  }
}

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.fillColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius:
              const BorderRadius.vertical(top: Radius.circular(14)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Monday , 29 may 2026',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
                Text('10 : 30 am',
                    style: const TextStyle(
                        color: Colors.white, fontSize: 12)),
              ],
            ),
          ),
          // Body
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Meeting Name',
                      style:  TextStyle(
                          fontSize: 17.sp,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Color(0xffD9FFE3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Presence',
                        style: TextStyle(
                            color: Color(0xff34C759),
                            fontSize: 10.5,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                 SizedBox(height: 14.h),
                Text(
                  'Supervisor : ${'Eng lina'}',
                  style:
                   TextStyle(color: AppColors.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
