import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:omnia_business/core/utils/app_colors.dart';

class DashedTimeWidget extends StatelessWidget {
  const DashedTimeWidget({super.key, required this.time});
  final String time ;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          time,
          style:  TextStyle(
            fontSize: 16.sp,
            color: AppColors.grey1Color,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  (constraints.constrainWidth() / 8).floor(),
                      (index) => const SizedBox(
                    width: 4,
                    height: 1,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}



