import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sign_in_button/sign_in_button.dart';
import '../viewmodels/signin_viewmodel.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final signInViewModel = Provider.of<SignInViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Center(
        child: signInViewModel.isSignedIn
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome, ${signInViewModel.user?.displayName ?? 'User'}!',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: signInViewModel.signOut,
                    child: Text('Sign Out'),
                  ),
                ],
              )
            : SizedBox(
                height: 7.h,
                child: SignInButton(
                  Buttons.google,
                  onPressed: () async {
                    print('000000000000000000000000');
                    signInViewModel.signInWithGoogle();
                  },
                ),
              ),
      ),
    );
  }
}
