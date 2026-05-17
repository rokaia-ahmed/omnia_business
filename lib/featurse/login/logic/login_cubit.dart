import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omnia_business/featurse/login/data/repos/login_repo.dart';

import '../../../core/utils/app_navigation.dart';
import '../../../core/utils/helper/app_dialogs.dart';
import '../../../core/utils/helper/app_helper.dart';
import '../../layout/presentation/screens/layout_screen.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {

  LoginRepo repo ;
  LoginCubit(this.repo) : super(LoginInitial());

   static LoginCubit get (context)=> BlocProvider.of(context);

  /// form key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  /// controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login(BuildContext context) async {
    await AppHelper.closeKeyboard();
    if (formKey.currentState!.validate()) {
      emit(LoadingState());
      final result = await repo.login(
        email: emailController.text,
        password: passwordController.text,
      );
      result.fold((l) {
        AppDialogs.toast(msg: l.message, state: ToastStates.error);
        emit(ErrorState(l.message));
      }, (r) {
        AppDialogs.toast(
            msg: r, state: ToastStates.success);
        emit(SuccessState());
        AppNavigator.pushAndRemove(screen: LayoutScreen(),
            context: context);
      });
    }
  }
}
