String baseUrl = 'https://back.yusur.app/api/';

class ApiConstants {
  /// login
  static const String login = 'user/login';
  static const String register = 'user/register';
  static const String becomeVendor = 'vender/becomeVender';
  static const String forgetPassword = 'user/forgetPassword';
  static const String verifyCode = 'user/verifiedForgetPasswordCode';
  static const String newPassword = 'user/changePasswordForForgetPassword';
  static const String changePassword = 'user/changePassword';
  /// profile
  static const String deleteAccount = 'user/delete';
  static const String updateProfile = 'user';
  static const String profile = 'user/profile';
  static const String uploadImage = 'files/uploadFile';
  static const String profileImage = 'user/imageProfile';
  static const String privacyPolicy = 'staticPage/privacy';
  static const String terms = 'staticPage/terms';
  static const String aboutUs = 'staticPage/aboutUs';
  static const String contactUs = 'social';
  static const String faq = 'staticPage/faqs';
  static const String myBooking = 'booking/myBooking';

  /// home
  static const String categories = 'appHome/categories';
  static const String banners = 'appHome/banner';
  static const String reviews = 'appHome/reviews';
  static const String discounts = 'appHome/discounts';

  /// vendors
  static const String vendors = 'vender/appVenders';
  static const String popularVendor = 'appHome/popularVenders';
  static const String packages = 'vender/packages';
  static const String addOn = 'vender/addon';
  static const String governorate = 'country/governorate';
  static const String area = 'country/area';
  static const String discount = 'booking/discount';
  static const String booking = 'booking';

}
