import 'package:flutter/material.dart';
import '../utils/text_styles.dart';

class CustomRequiredText extends StatelessWidget {
  const CustomRequiredText({super.key, this.textColor, required this.text, this.fontSize});
   final Color? textColor ;
   final String text ;
   final double? fontSize ;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text,
          style: TextStyles.textStyle12w700.copyWith(
            color: textColor,
            fontSize: fontSize,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Icon(Icons.star_rate_sharp,
            size: 10,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
