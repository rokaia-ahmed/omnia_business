import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omnia_business/core/dependency_injection/injection.dart';
import 'package:omnia_business/features/home/logic/home_cubit.dart';
import '../../../calendar/presentation/widgets/top_title.dart';
import '../../../home/presentation/widgets/recent_document_list.dart';

class DocumentsScreen extends StatelessWidget {
  const DocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..getDocuments(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Column(
              children: [
                TopTitle(title: 'Documents',),
                SizedBox(height: 30.h,),
                RecentDocumentList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
