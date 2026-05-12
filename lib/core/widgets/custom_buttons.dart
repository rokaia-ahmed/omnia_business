import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import '../utils/text_styles.dart';

class CustomDefaultButton extends StatelessWidget {
  const CustomDefaultButton({
    super.key,
    required this.onTap,
    required this.text,
    this.width,
    this.height,
    this.loading,
    this.radius,
    this.color,
  });

  final Function()? onTap;
  final String text;
  final double? width;
  final double? height;
  final double? radius;
  final bool? loading;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      elevation: 0.0,
      disabledColor: AppColors.borderColor,
      height: height ?? 48.h,
      minWidth: width ?? double.infinity,
      color:
          loading == true ? AppColors.borderColor : color ?? AppColors.primary,
      shape: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(radius ?? 8),
      ),
      child: loading == true
          ? Padding(
            padding:  EdgeInsets.symmetric(vertical: 5.h),
            child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
          )
          : Text(
              text,
              style: TextStyles.textStyle18w600,
            ),
    );
  }
}

////////////////////////////////////////////
class CustomBorderButton extends StatelessWidget {
  const CustomBorderButton(
      {super.key,
      this.width,
      required this.onTap,
      required this.title,
      this.height,
      this.loading,
      this.color,
      this.textColor,
      this.borderSide});

  final double? width;
  final double? height;
  final Function() onTap;
  final String title;
  final bool? loading;
  final Color? color;
  final Color? textColor;
  final BorderSide? borderSide;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width ?? double.infinity,
      height: height ?? 40.h,
      color: color,
      onPressed: onTap,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: borderSide ??
            BorderSide(
              color: AppColors.primary,
            ),
      ),
      child: loading == true
          ? CircularProgressIndicator(
              color: AppColors.primary,
            )
          : Text(
              title,
              style: TextStyles.textStyle12w700.copyWith(
                color: textColor ?? AppColors.primary,
              ),
            ),
    );
  }
}

/////////////////////////////////////////////

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon(
      {super.key,
      this.width,
      required this.onTap,
      required this.title,
      this.height,
      this.loading,
      this.color,
      this.textColor,
      this.borderSide,
      required this.icon});

  final double? width;
  final double? height;
  final Function() onTap;
  final String title;
  final bool? loading;
  final Color? color;
  final Color? textColor;
  final Widget icon;
  final BorderSide? borderSide;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width ?? double.infinity,
      height: height ?? 45.h,
      color: color,
      onPressed: onTap,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(60),
        borderSide: borderSide ??
            BorderSide(
              color: AppColors.primary,
            ),
      ),
      child: loading == true
          ? CircularProgressIndicator(
              color: AppColors.primary,
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  title,
                  style: TextStyles.textStyle12w700.copyWith(
                    color: textColor ?? AppColors.primary,
                  ),
                ),
              ],
            ),
    );
  }
}
