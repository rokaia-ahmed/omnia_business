import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omnia_business/core/utils/app_colors.dart';



class UpcomingMeetingsList extends StatelessWidget {
  const UpcomingMeetingsList({super.key});


  @override
  Widget build(BuildContext context) {
    final List<_MeetingItem> _meetings = const [
      _MeetingItem(
        title: 'Ui/Ux Meeting',
        time: '10 : 30 Am',
        supervisor: 'Eng. Lina',
        status: 'Pending',
      ),
      _MeetingItem(
        title: 'Ui/Ux Meeting',
        time: '02 : 00 Pm',
        supervisor: 'Eng. Sara',
        status: 'Confirmed',
      ),
    ];
    return    SizedBox(
      height: 230.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _meetings.length,
        separatorBuilder: (_, __) =>  SizedBox(width: 16.w),
        itemBuilder: (context, i) =>
            _MeetingCard(item: _meetings[i]),
      ),
    );
  }
}


class _MeetingCard extends StatelessWidget {
  final _MeetingItem item;

  const _MeetingCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260.w,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.fillColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Meeting icon
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.primary,
                      Color(0xFF0076A8),
                    ],
                  ),
                ),
                child: const Icon(Icons.groups_outlined,
                    color: Colors.white, size: 22),
              ),
              // Status badge
              Container(
                padding:
                 EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Color(0xffC7EDFE),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  item.status,
                  style: TextStyle(
                    color: AppColors.green2,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
           SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.title,
                style:  TextStyle(
                  color: AppColors.textColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                item.time,
                style:  TextStyle(color: AppColors.textColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp),
              ),
            ],
          ),
           SizedBox(height: 16.h),
          Text(
            'Supervisor : ${item.supervisor}',
            style:  TextStyle(
              fontWeight: FontWeight.w500,
              color:  AppColors.textColor,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 16.h),
          // Avatar stack
          _AvatarStack(),
        ],
      ),
    );
  }
}

class _AvatarStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const colors = [Color(0xFFFFB74D), Color(0xFF64B5F6), Color(0xFFA5D6A7)];
    return SizedBox(
      height: 40.h,
      child: Stack(
        alignment: Alignment.topLeft,
        children: List.generate(3, (i) {
          return Positioned(
            left: (i) * 24.0,
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colors[i],
                border: Border.all(color: Colors.white, width: 1.5),
              ),
              child: Center(
                child: Text(
                  ['D', 'L', 'S'][i],
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _MeetingItem {
  final String title, time, supervisor, status;

  const _MeetingItem({
    required this.title,
    required this.time,
    required this.supervisor,
    required this.status,
  });
}
