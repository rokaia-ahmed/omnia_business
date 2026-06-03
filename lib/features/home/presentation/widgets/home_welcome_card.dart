import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:omnia_business/core/utils/app_colors.dart';
import 'package:omnia_business/core/utils/app_images.dart';
import 'package:omnia_business/features/home/logic/home_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeWelcomeCard extends StatelessWidget {
  const HomeWelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
     return current is ProfileLoading ||
          current is ProfileError ||
         current is ProfileLoaded;},
      builder: (context, state) {
        final cubit = HomeCubit.get(context);
        bool isLoading = false ;
          int count = cubit.profileModel?.data.scheduledMeetingsCount??0;
          String name = cubit.profileModel?.data.name??"user" ;
        if(state is ProfileLoading ||
            cubit.profileModel ==null){
          isLoading = true ;
        }
          return Skeletonizer(
            enabled: isLoading,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF184A6D),
                    AppColors.primary
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome, ${name.split(' ').first}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.3,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.calendar,
                        colorFilter: ColorFilter.mode(Colors.white,
                            BlendMode.srcIn),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        DateFormat('EEEE , dd MMMM yyyy', 'en').format(DateTime.now()),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Divider(color: Colors.white54, height: 1),
                  ),
                  Text(
                    'You Have $count Schedule Meetings',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );

      },
    );
  }
}