import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omnia_business/core/dependency_injection/injection.dart';
import 'package:omnia_business/features/home/logic/home_cubit.dart';

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
      create: (context) => getIt<HomeCubit>()..getUpcomingMeetings()..getDocuments(),
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
                      children: [
                        SizedBox(height: 24.h),

                        ///  Home welcome card
                        HomeWelcomeCard(),
                        SizedBox(height: 24.h),

                        /// Upcoming Meetings
                        HomeSectionHeader(
                          title: 'Upcoming Meeting',
                          onSeeAll: () {},
                        ),
                        SizedBox(height: 24.h),
                        UpcomingMeetingsList(),
                        SizedBox(height: 24.h),
                        // Recent Documents
                        HomeSectionHeader(
                          title: 'Recent Documents',
                          onSeeAll: () {},
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
