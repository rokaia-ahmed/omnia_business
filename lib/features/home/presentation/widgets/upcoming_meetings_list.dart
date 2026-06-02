import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omnia_business/core/utils/app_colors.dart';
import 'package:omnia_business/features/home/logic/home_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../data/models/upcoming_meetings_model.dart';

class UpcomingMeetingsList extends StatelessWidget {
  const UpcomingMeetingsList({super.key});

  @override
  Widget build(BuildContext context) {
    final Meeting meeting =
      Meeting(
        id: '',
        title: 'ui/ux meeting',
        description: 'test',
        location: '',
        startTime: '10 : 30 am',
        endTime: '10 : 30 am',
        status: '',
        supervisor: Supervisor(
          id: '',
          name: 'eng: lina',
          avatar: null,
          email: '',
        ),
        myAttendanceStatus: '',
        myAttendanceNote: null,
        employees: const [],
        totalEmployees: 3,
      );
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        return current is UpcomingMeetingsLoading ||
            current is UpcomingMeetingsLoaded ||
            current is UpcomingMeetingsError;
      },
      builder: (context, state) {
        final cubit = HomeCubit.get(context);
        if (cubit.upcomingMeetingsModel == null) {
          return Skeletonizer(
            child: SizedBox(
              height: 240.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                separatorBuilder: (context,_) => SizedBox(width: 16.w),
                itemBuilder: (context, i) => _MeetingCard(
                  item:meeting,
                ),
              ),
            ),
          );
        } else if (state is UpcomingMeetingsLoaded){
          return SizedBox(
            height: 245.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount:  cubit.upcomingMeetingsModel!.data.data.length,
              separatorBuilder: (_,_) => SizedBox(width: 16.w),
              itemBuilder: (context, i) => _MeetingCard(
                item: cubit.upcomingMeetingsModel!.data.data[i],
              ),
            ),
          );

        } else if (state is UpcomingMeetingsError) {
          return Text('Error loading meetings');
        }
        return SizedBox();
      },
    );
  }
}

class _MeetingCard extends StatelessWidget {
  final Meeting item;

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
                    colors: [AppColors.primary, Color(0xFF0076A8)],
                  ),
                ),
                child: const Icon(
                  Icons.groups_outlined,
                  color: Colors.white,
                  size: 22,
                ),
              ),
              // Status badge
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  item.title,
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                item.startTime.substring(0, 10),
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            'Supervisor : ${item.supervisor.name}',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.textColor,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 14.h),
          // Avatar stack
          AvatarStack(item: item.employees),
        ],
      ),
    );
  }
}

class AvatarStack extends StatelessWidget {
  final List<Supervisor> item;
  const AvatarStack({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Stack(
        alignment: Alignment.topLeft,
        children: List.generate(item.length, (i) {
          return  item[i].avatar != null? Positioned(
            left: (i) * 24.0,
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.5),
              ),
              child: Center(
                child: Image.network(
                  item[i].avatar,
                  errorBuilder: (context, _, _) => SizedBox(),
                ),
              ),
            ),
          ):SizedBox();
        }),
      ),
    );
  }
}
