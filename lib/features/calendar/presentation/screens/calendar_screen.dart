import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../home/presentation/widgets/home_section_header.dart';
import '../../../home/presentation/widgets/recent_document_list.dart';
import '../widgets/calendar_top_header.dart';
import '../../../history/presentation/widgets/history_list.dart';
import '../widgets/dashed_time_widget.dart';
import '../widgets/time_line_card.dart';
import '../widgets/top_title.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 18.h),
            child: Column(
              children: [
                TopTitle(title:'Calendar',),
                SizedBox(height: 30.h),
                CalendarTopHeader(),
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
                      'Monday , 29 may',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.fillColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// 10 AM
                      _buildTimeTitle("10 Am"),

                       SizedBox(height: 14.h),
                      const TimelineCard(
                        title: "Stand Up Meeting",
                        from: "10 : 00 Am",
                        to: "10 : 25 Am",
                        status: "Absence",
                        statusColor: Color(0xffFF6B6B),
                        lineColor: Color(0xffFF4D4D),
                        backgroundStatus: Color(0xffFFE8E8),
                      ),

                       SizedBox(height: 20.h),

                      DashedTimeWidget(time: "10 Am"),

                       SizedBox(height: 10.h),

                      DashedTimeWidget(time: "11 Am"),

                       SizedBox(height: 30.h),

                      /// 12 AM
                      _buildTimeTitle("12 Am"),

                      const SizedBox(height: 14),

                      const TimelineCard(
                        title: "Stand Up Meeting",
                        from: "12 : 10 Am",
                        to: "12 : 45 Am",
                        status: "Presence",
                        statusColor: Color(0xff3CCB6C),
                        lineColor: Color(0xff47D16A),
                        backgroundStatus: Color(0xffE7F9EC),
                      ),

                      const SizedBox(height: 16),

                      const TimelineCard(
                        title: "Stand Up Meeting",
                        from: "12 : 55 Am",
                        to: "01 : 45 Am",
                        status: "In The Meeting",
                        statusColor: Color(0xff22B8B0),
                        lineColor: Color(0xff2AA89D),
                        backgroundStatus: Color(0xffDFFBFA),
                      ),

                       SizedBox(height: 30.h),

                      DashedTimeWidget(time: "02 Am"),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTimeTitle(String title) {
    return Text(
      title,
      style:  TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.textColor,
      ),
    );
  }


}
