import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../calendar/presentation/screens/calendar_screen.dart';
import '../../../home/presentation/screens/home_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key, this.index});
  final int? index;
  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int activeIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    CalendarScreen(),
    Container(),
    Container(),
  ];

  List<String> texts = ['Home', 'Calendar', 'History', 'Documents'];

  List<String> icons = [
    AppIcons.home,
    AppIcons.calendar,
    AppIcons.history,
    AppIcons.documents,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: screens.length,
        gapWidth: 0,
        height: 75.h,
        elevation: 20,
        leftCornerRadius: 0,
        rightCornerRadius: 0,
        gapLocation: GapLocation.none,
        activeIndex: activeIndex,
        tabBuilder: (int index, bool isActive) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: isActive ? AppColors.second : Colors.transparent,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: SvgPicture.asset(
                  icons[index],
                  colorFilter: ColorFilter.mode(
                    isActive ? AppColors.primary : AppColors.grey1Color,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                texts[index],
                style: TextStyles.textStyle14w500.copyWith(
                  color: isActive ? AppColors.primary : AppColors.grey1Color,
                ),
              ),
            ],
          );
        },
        onTap: (index) async {
          setState(() {
            activeIndex = index;
          });
        },
      ),
      body: screens[activeIndex],
    );
  }
}
