// ignore_for_file: prefer_const_constructors

import 'package:apna_scorecard/views/home_view.dart';
import 'package:apna_scorecard/views/signin_view.dart';
import 'package:apna_scorecard/views/start_match_view.dart';
import 'package:apna_scorecard/views/toss_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/signin_viewmodel.dart';

class AppRoutes {
  static const String initialRoute = '/';
  static const String home = '/home';
  static const String signIn = '/signin';
  static const String startMatch = '/startMatch';
  static const String toss = '/toss';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => FutureBuilder(
            future: Provider.of<SignInViewModel>(context, listen: false)
                .checkUserOnStartup(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(child: Text('Error loading app'));
              }
              return Consumer<SignInViewModel>(
                builder: (context, signInViewModel, _) {
                  return signInViewModel.isSignedIn
                      ? const HomeView()
                      : const SignInView();
                },
              );
            },
          ),
        );

      case home:
        return MaterialPageRoute(builder: (_) => HomeView());

      case signIn:
        return MaterialPageRoute(builder: (_) => SignInView());

      case startMatch:
        return MaterialPageRoute(builder: (_) => StartMatchView());

      case toss:
        return MaterialPageRoute(builder: (_) => TossView());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('No route defined')),
          ),
        );
    }
  }
}
