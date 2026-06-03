import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omnia_business/core/utils/app_colors.dart';
import 'package:omnia_business/features/history/logic/history_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../data/models/my_history_model.dart';
class HistoryList extends StatelessWidget {
  final HistoryCubit cubit ;
  final HistoryState state ;
  const HistoryList({super.key, required this.cubit,
    required this.state});

  @override
  Widget build(BuildContext context) {
    List<History> dummyData = List.generate(5, (i)=>History(id: '',
        status: 'presence', note: '',
        createdAt: '2026-06-02T09:33:00.000Z',
        updatedAt: '2026-06-02T09:33:00.000Z',
        meeting: Meeting(id: '', title: 'UI/UX Weekly Standup',
          description: '', location: '',
          startTime: '2026-06-02T09:33:00.000Z', endTime: '',
          status: '', admin: Admin(id: '',
              name: 'lina', email: '', avatar: ''),
        ),
        isAutoResolved: true)
        );
    bool loading = false ;
    if(state is HistoryLoading){
      loading = true ;

    }else if(state is HistoryError){
      return SizedBox();
    }
    return Expanded(
      child: Skeletonizer(
        enabled: loading,
        child: ListView.separated(
            shrinkWrap: true,
            itemCount: loading?5:cubit.historyModel!.data.data.length,
            separatorBuilder: (_, _) =>  SizedBox(height: 20.h),
            itemBuilder: (context, i) => HistoryCard(
              history:loading?dummyData[i]: cubit.historyModel!.data.data[i],
            ),
        ),
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key, required this.history});
  final History history ;
  @override
  Widget build(BuildContext context) {
    Map<String,Color> colors = {
      'ABSENCE': Color(0xffFF6B6B),
      'PENDING': Color(0xff279590),
      'PRESENCE': Color(0xff34C759),
      'IN_MEETING': Color(0xff279590),
    };
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
                  history.meeting.startTime.substring(0,10),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
                Text(history.meeting.startTime.substring(12,16),
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
                      history.meeting.title,
                      style:  TextStyle(
                          fontSize: 16.sp,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: colors[history.status]?.withValues(alpha: 0.2)?? Color(0xffD9FFE3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        history.status.toLowerCase(),
                        style: TextStyle(
                            color: colors[history.status]??Color(0xff34C759),
                            fontSize: 10.5,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                 SizedBox(height: 14.h),
                Text(
                  'Supervisor : ${history.meeting.admin.name}',
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
