import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../home/presentation/widgets/home_section_header.dart';
import '../../../home/presentation/widgets/recent_document_list.dart';
import '../widgets/calendar_top_header.dart';
import '../widgets/history_list.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 12.h,),
                CalendarTopHeader(),
                SizedBox(height: 12.h,),
                HomeSectionHeader(title: 'Recent Documents',
                  onSeeAll: () {  },),
                SizedBox(height: 16.h,),
                RecentDocumentList(),
                SizedBox(height: 20.h,),
                HomeSectionHeader(title: 'My History',
                  onSeeAll: () {  },),
                SizedBox(height: 16.h,),
                HistoryList(),
                SizedBox(height: 20.h,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
