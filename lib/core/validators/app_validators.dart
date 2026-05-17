
import '../network/local/cache/chace_helper.dart';

String translateString(String english, String arabic) {
  return CacheHelper.getData('lang') == 'en'
      ? english
      : arabic;
}

String? validateName(String value) {
  Pattern pattern = r'^[A-Za-z][a-zA-Z0-9.\-_$@*!]{2,30}$';
  RegExp regex = RegExp(pattern.toString());
  if (value.isEmpty) {
    return 'يرجي ادخال اسم المستخدم';
  } else if (!regex.hasMatch(value)) {
    return 'اسم المستخدم اكبر من 3 ولايوجد مسافات ولا يبدا بارقام';
  }
  return null;
}

String? validate(String value) {
  if (value.isEmpty) {
    return translateString('this field is required','هذا الحقل مطلوب');
  }
  return null;
}

String? validatePassword(String value) {
  if (value.isEmpty) {
    return translateString('password is required','كلمة المرور مطلوبة');
  } else if (value.length < 8) {
    return translateString(
        'password must be at least 6 characters',
        'يجب أن تتكون كلمة المرور من 8 أحرف على الأقل');
  } /*else if (!RegExp(".*[0-9].*").hasMatch(value)) {
    return
      'must contain numbers';
  } else if (!RegExp(".*[a-z].*").hasMatch(value)) {
    return
      'must contain lowercase letters';
  }*/
  return null;
}
String? validateConfirmPassword(String value, String confirm) {
  if (value.isEmpty) {
    return translateString('you should enter password',
        'يجب ادخال كلمة المرور');
  } else if (value != confirm) {
    return translateString('passwords must be equal',
        'يجب ان تكونا كلمتا المرور متطابقتين');
  }
  return null;
}


String? validateEmail(String value) {
  Pattern pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  RegExp regex = RegExp(pattern.toString());
  if (value.isEmpty) {
    return translateString("email is required",'البريد الإلكتروني مطلوب');
  } else if (!regex.hasMatch(value)) {
    return
      translateString('you should enter valid Email',
          'يجب إدخال بريد إلكتروني صحيح');
  }
  return null;
}

String? validateMobile(String value) {
  if (value.isEmpty) {
    return translateString('phone is required','رقم الهاتف مطلوب');
  } else if (value.length<8) {
    return translateString('mobile phone must be 8 digits',
        'رقم الهاتف المحمول يجب أن يكون مكونًا من 8 أرقام');
  }
  return null;
}
