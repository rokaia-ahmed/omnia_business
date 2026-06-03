import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omnia_business/core/utils/app_images.dart';
import 'package:omnia_business/core/widgets/custom_text_form_field.dart';
import 'package:omnia_business/features/history/logic/history_cubit.dart';
import '../../../../core/dependency_injection/injection.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../calendar/presentation/widgets/top_title.dart';
import '../widgets/history_list.dart';
import '../widgets/history_title_row.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt<HistoryCubit>()
        ..getHistory(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: BlocBuilder<HistoryCubit, HistoryState>(
              builder: (context, state) {
                final cubit = HistoryCubit.get(context);
                return Column(
                  children: [
                    TopTitle(title: 'My History',),
                    SizedBox(height: 30.h,),
                    CustomTextField(
                      controller: TextEditingController(),
                      fillColor: AppColors.fillColor,
                      prefixWidget: SvgPicture.asset(
                        AppIcons.search, fit: BoxFit.none,),
                      hint: 'Search With Date  or Month',
                      onTap: (){
                        showDatePicker(
                            context: context,
                            firstDate: DateTime(2026),
                            lastDate: DateTime(2080),
                        ).then((v){
                          if(v!=null){
                            cubit.getHistory(day: v.day,month: v.month);
                          }
                        });
                      },
                    ),
                    SizedBox(height: 30.h,),
                    HistoryTitleRow(
                      title1: 'This Month', title2:
                    '${state is HistorySuccess ? cubit.historyModel!.data.data.length :0} Meetings',),
                    SizedBox(height: 24.h,),
                    HistoryList(cubit: cubit, state: state,),
                    /*SizedBox(height: 30.h,),
                    HistoryTitleRow(title1: 'March', title2: '2 Meetings',),
                    SizedBox(height: 24.h,),
                    HistoryList(cubit: cubit, state: state,),*/
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
