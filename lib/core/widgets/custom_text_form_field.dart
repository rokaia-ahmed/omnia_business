import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/app_colors.dart';
import '../utils/app_constants.dart';
import '../utils/text_styles.dart';


class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hint,
    this.onTap,
    this.validator,
    this.suffixColor,
    this.prefixColor,
    this.prefixWidget,
    this.minLines = 1,
    this.maxLines = 1,
    this.enabled = true,
    this.enableBorder = false,
    this.inputFormatters,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixWidget,
    this.textDirection,
    this.textAlign,
    this.readOnly = false,
    this.fillColor,
    this.onEditingComplete, this.onChanged,
    this.onFieldSubmitted, this.onSaved,
    this.radius, this.hintStyle,
  });

  final TextInputType keyboardType;
  final TextEditingController controller;

  final String? hint;
  final TextDirection? textDirection;
  final TextAlign? textAlign;
  final TextStyle? hintStyle;

  final Widget? prefixWidget;
  final Color? prefixColor;
  final Color? fillColor;

  final Widget? suffixWidget;
  final Color? suffixColor;

  final int minLines;
  final int maxLines;

  final double? radius;

  final bool enabled;
  final bool enableBorder;
  final bool readOnly;
  final bool obscureText;
  final Function()? onTap;
  final Function()? onEditingComplete;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final Function(String?)? onSaved;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: AppSize.getVerticalSize(50),
      child: TextFormField(
        onTap: onTap,
        enabled: enabled,
        onChanged:onChanged ,
        onSaved: onSaved,
        onEditingComplete:onEditingComplete ,
        onFieldSubmitted:onFieldSubmitted ,
        minLines: minLines,
        maxLines: maxLines,
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        validator: validator ?? (val) => null,
        textDirection: textDirection,
        textAlign: textAlign ?? TextAlign.start,
        readOnly: readOnly,
        decoration: InputDecoration(
          fillColor: fillColor,
          filled: fillColor != null,
          /// HINT
          hintText: hint,
          hintStyle:hintStyle?? TextStyles.textStyle14w500Grey1,

          /// ICON
          prefixIcon:  prefixWidget,
          suffixIcon: suffixWidget,
          errorStyle: const TextStyle(height: 1, color: Colors.red),
          enabledBorder: AppConstants.defaultBorder.copyWith(
            borderSide: enableBorder ?BorderSide(color: AppColors.borderColor) : BorderSide.none,
          ),
          border:AppConstants.defaultBorder ,
          disabledBorder:AppConstants.defaultBorder ,
          focusedBorder: AppConstants.defaultBorder,
          contentPadding: const EdgeInsets.all(10),
        ),
      ),
    );
  }
}



class HttpsForWwwOnlyFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final text = newValue.text.trim();

    // Only add https:// if it starts with "www." and doesn't already have http/https
    if (text.startsWith('www.') && !text.startsWith('http://') && !text.startsWith('https://')) {
      final newText = 'https://$text';
      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
    }

    return newValue;
  }
}