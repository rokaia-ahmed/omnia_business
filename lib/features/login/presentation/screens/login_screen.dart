import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omnia_business/core/dependency_injection/injection.dart';
import 'package:omnia_business/core/utils/app_colors.dart';
import 'package:omnia_business/core/utils/app_images.dart';
import 'package:omnia_business/core/validators/app_validators.dart';
import 'package:omnia_business/core/widgets/custom_buttons.dart';
import 'package:omnia_business/core/widgets/custom_text_form_field.dart';

import '../../logic/login_cubit.dart';
import '../widgets/field_label.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _emailTouched = false;
  bool _passwordTouched = false;
  bool _emailValid = false;
  bool _obscure = false;

  void _validateEmail(String value) {
    final emailRegex = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w{2,}$');
    setState(() {
      _emailTouched = true;
      _emailValid = emailRegex.hasMatch(value.trim());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 20.h),
            child: BlocProvider(
              create: (context) => getIt<LoginCubit>(),
              child: BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  final cubit = LoginCubit.get(context);
                  return Form(
                    key: cubit.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 52.h),
                        Center(
                          child: SvgPicture.asset(AppSvg.logo, width: 153.w),
                        ),
                        SizedBox(height: 52.h),
                        FieldLabel(text: 'Email'),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          controller: cubit.emailController,
                          enableBorder: _emailTouched,
                          keyboardType: TextInputType.emailAddress,
                          fillColor: _emailTouched
                              ? Colors.transparent
                              : AppColors.fillColor,
                          hint: 'Enter Email',
                          onChanged: _validateEmail,
                        ),
                        if (_emailTouched)
                          Padding(
                            padding: const EdgeInsets.only(top: 6),
                            child: Row(
                              children: [
                                Icon(
                                  _emailValid
                                      ? Icons.check_circle_rounded
                                      : Icons.cancel_rounded,
                                  size: 15,
                                  color: _emailValid
                                      ? AppColors.green
                                      : Colors.red,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  _emailValid
                                      ? 'Correct Email'
                                      : 'Invalid Email',
                                  style: TextStyle(
                                    fontSize: 12.5,
                                    color: _emailValid
                                        ? AppColors.green
                                        : Colors.red,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        SizedBox(height: 24.h),
                        FieldLabel(text: 'Password'),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          controller: cubit.passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          enableBorder: _passwordTouched,
                          validator: (v)=>validatePassword(v!),
                          fillColor: _passwordTouched
                              ? Colors.transparent
                              : AppColors.fillColor,
                          hint: 'Enter Password',
                          obscureText: _obscure,
                          onChanged: (v) {
                            setState(() {
                              _passwordTouched = true;
                            });
                          },
                          suffixWidget: _passwordTouched
                              ? InkWell(
                                  onTap: () {
                                    setState(() {
                                      _obscure = !_obscure;
                                    });
                                  },
                                  child: SvgPicture.asset(
                                    _obscure ? AppIcons.eyeOn : AppIcons.eyeOff,
                                    fit: BoxFit.none,
                                  ),
                                )
                              : null,
                        ),
                        SizedBox(height: 48.h),
                        CustomDefaultButton(
                          loading: state is LoadingState,
                          onTap: () {
                            if(_emailValid==true) {
                              cubit.login(context);
                            }
                          },
                          text: 'Login',
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
