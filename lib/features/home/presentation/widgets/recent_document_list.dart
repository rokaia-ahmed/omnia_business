import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omnia_business/core/utils/app_colors.dart';
import 'package:omnia_business/core/utils/app_images.dart';
import 'package:omnia_business/features/home/logic/home_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../data/models/documents_model.dart';

class RecentDocumentList extends StatelessWidget {
  const RecentDocumentList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        return current is DocumentsLoading ||
            current is DocumentsLoaded ||
            current is DocumentsError;
      },
      builder: (context, state) {
        final cubit = HomeCubit.get(context);
        bool isEnable = false ;
        Datum items =  Datum(
          fileName: 'doc name.pdf',
          fileSize: 200,
          fileType: 'pdf',
          fileUrl: '',
          createdAt: '2026-05-29',updatedAt: '',
          id: '',uploader: null,
        );
        if(state is DocumentsError){
          return const Center(child: Text('Error loading documents'),);
        }
        if (state is DocumentsLoading||cubit.documentsModel ==null){
          isEnable = true ;
        }
        return Skeletonizer(
          enabled:isEnable,
          child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: isEnable?5:cubit.documentsModel!.data.data.length,
              separatorBuilder: (_, _) => SizedBox(height: 10.h),
              itemBuilder: (context, i) => _DocumentTile(
                item: isEnable?items : cubit.documentsModel!.data.data[i],)),
        );
      },
    );
  }
}


class _DocumentTile extends StatelessWidget {
   final Datum item ;
  const _DocumentTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.fillColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // PDF Icon
          Container(
            width: 56.w,
            height: 56.h,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(AppSvg.pdf, fit: BoxFit.none,),
          ),
          SizedBox(width: 10.w),
          // Name + meta
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${item.fileName} ${item.fileType}',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Text(
                      item.createdAt.substring(0,10),
                      style:
                      TextStyle(
                        color: AppColors.grey1Color,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Container(
                      width: 8.w,
                      height: 8.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      '${item.fileSize} KB',
                      style:
                      TextStyle(
                        color: AppColors.grey1Color,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // More icon
          //  const Icon(Icons.more_vert, color: kTextGrey, size: 20),
        ],
      ),
    );
  }
}