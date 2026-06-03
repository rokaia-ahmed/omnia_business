import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omnia_business/core/dependency_injection/injection.dart';
import 'package:omnia_business/core/utils/app_navigation.dart';
import 'package:omnia_business/features/home/logic/home_cubit.dart';
import 'package:omnia_business/features/layout/presentation/screens/layout_screen.dart';

import '../../../../core/utils/app_colors.dart';
import '../widgets/home_section_header.dart';
import '../widgets/home_top_header.dart';
import '../widgets/home_welcome_card.dart';
import '../widgets/recent_document_list.dart';
import '../widgets/upcoming_meetings_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()
        ..getUpcomingMeetings()..getDocuments()..getProfile(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Column(
              children: [

                /// home top header
                HomeTopHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 24.h),

                        ///  Home welcome card
                        HomeWelcomeCard(),
                        SizedBox(height: 24.h),

                        /// Upcoming Meetings
                       /* HomeSectionHeader(
                          title: 'Upcoming Meeting',
                          onSeeAll: () {},
                        ),*/
                        Text(
                          'Upcoming Meeting',
                          style:  TextStyle(
                            fontSize: 18.sp,
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 24.h),
                        UpcomingMeetingsList(),
                        SizedBox(height: 24.h),
                        // Recent Documents
                        HomeSectionHeader(
                          title: 'Recent Documents',
                          onSeeAll: () {
                            AppNavigator.push(
                                screen: LayoutScreen(index: 3,),
                                context: context);
                          },
                        ),
                        SizedBox(height: 24.h),
                        RecentDocumentList(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
