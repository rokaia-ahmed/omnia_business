import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omnia_business/core/dependency_injection/injection.dart';
import 'package:omnia_business/features/calendar/logic/calendar_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/calendar_top_header.dart';
import '../widgets/dashed_time_widget.dart';
import '../widgets/time_line_card.dart';
import '../widgets/top_title.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<CalendarCubit>()
            ..getTimeline(DateTime.now().toString().substring(0, 10)),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
              child: BlocBuilder<CalendarCubit, CalendarState>(
                builder: (context, state) {
                  final cubit = CalendarCubit.get(context);
                  Map<String,Color> colors = {
                    'ABSENCE': Color(0xffFF6B6B),
                    'PENDING': Color(0xff279590),
                  };
                  return Column(
                    children: [
                      TopTitle(title: 'Calendar'),
                      SizedBox(height: 30.h),
                      CalendarTopHeader(
                        onDaySelected: (DateTime day) {
                          print(day.toString().substring(0, 10));
                          cubit.getTimeline(day.toString().substring(0, 10));
                        },
                      ),
                      SizedBox(height: 16.h),

                      /// Daily Timeline
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Daily Timeline',
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            state is CalendarLoaded
                                ? cubit.timelineModel!.data.date
                                : '${DateTime.now()}',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h),
                      if (state is CalendarLoading) ...[
                        Center(child: CircularProgressIndicator()),
                      ] else if (state is CalendarLoaded) ...[
                        if(cubit.timelineModel!.data.timeline.isNotEmpty)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.fillColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => TimelineCard(
                              title: cubit.timelineModel!.data.timeline[index].title,
                              from: cubit.timelineModel!.data.timeline[index].startTime.substring(12,16),
                              to: cubit.timelineModel!.data.timeline[index].endTime.substring(12,16),
                              status: cubit.timelineModel!.data.timeline[index].myAttendanceStatus.toLowerCase(),
                              statusColor: colors[cubit.timelineModel!.data.timeline[index].myAttendanceStatus]??AppColors.primary,
                              lineColor: colors[cubit.timelineModel!.data.timeline[index].myAttendanceStatus]??AppColors.primary,
                              backgroundStatus: colors[cubit.timelineModel!.data.timeline[index].myAttendanceStatus]?.withValues(alpha: 0.2)??AppColors.primary,
                            ),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 12.h),
                            itemCount:
                                cubit.timelineModel!.data.timeline.length,
                          ),
                        ),
                      ],
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTimeTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textColor,
      ),
    );
  }
}
