import 'package:flutter/material.dart';
import '../utils/app_constants.dart';
import '../utils/text_styles.dart';


class CustomDropdownField extends StatelessWidget {
  const CustomDropdownField({
    super.key,
    this.value,
    this.items,
    this.validator,
    required this.hitText,
    required this.onChanged,
    this.onTap,
    this.hitColor,
    this.iconColor,
  });

  final String hitText;
  final Color? hitColor;
  final Color? iconColor;
  final dynamic value;
  final Function(dynamic) onChanged;
  final Function()? onTap;
  final List<DropdownMenuItem<Object>>? items;
  final FormFieldValidator<dynamic>? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     // height: AppSize.getVerticalSize(50),
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonFormField(
          isExpanded: true,
          initialValue: value,
          items: items,
          onTap: onTap,
          dropdownColor: Colors.white,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color:  Colors.black,
          ),
          icon: Icon(Icons.keyboard_arrow_down),
          hint:Text(hitText,
            style:TextStyles.textStyle10w400,
          ) ,
          borderRadius:BorderRadius.zero ,
          alignment:AlignmentDirectional.centerStart,
          decoration: InputDecoration(
            contentPadding:EdgeInsets.only(top: 10,bottom: 10,right: 10,left: 10),
            errorStyle: const TextStyle( color: Colors.red),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            border:AppConstants.defaultBorder,
            enabledBorder:AppConstants.defaultBorder,
            focusedBorder: AppConstants.defaultBorder,
          ),
          validator: validator ,
          onChanged: (dynamic val) => onChanged(val),
        ),
      ),
    );
  }
}