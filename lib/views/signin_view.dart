// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sign_in_button/sign_in_button.dart';
import '../utils/app_theme.dart';
import '../viewmodels/signin_viewmodel.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final signInViewModel = Provider.of<SignInViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Log In',
          style: TextStyle(color: AppColors.textPrimary),
        ),
        backgroundColor: AppColors.primaryLighter,
      ),
      backgroundColor: AppColors.primaryLightest,
      body: Center(
        child: SizedBox(
          height: 7.h,
          child: SignInButton(
            Buttons.google,
            onPressed: () async {
              EasyLoading.show();
              await signInViewModel.signInWithGoogle();
              EasyLoading.dismiss();
            },
          ),
        ),
      ),
    );
  }
}
