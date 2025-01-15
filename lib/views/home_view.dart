// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously
import 'package:apna_scorecard/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../utils/app_routes.dart';
import '../viewmodels/signin_viewmodel.dart';
import '/views/widgets/custom_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<void> getData() async {}

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final signInViewModel = Provider.of<SignInViewModel>(context);
    final textStyle = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Apna Scorecard',
          style: TextStyle(color: AppColors.textPrimary),
        ),
        backgroundColor: AppColors.primaryLighter,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await signInViewModel.signOut();
            },
          ),
        ],
      ),
      backgroundColor: AppColors.primaryLightest,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customButton(
              text: "Join Match",
              height: 10.h,
              style: textStyle.bodyLarge?.copyWith(
                  color: AppColors.white, fontWeight: FontWeight.w600),
              color: AppColors.success,
            ),
            SizedBox(height: 5.h),
            customButton(
              text: "Start Match",
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.startMatch);
              },
              height: 10.h,
              style: textStyle.bodyLarge?.copyWith(
                  color: AppColors.white, fontWeight: FontWeight.w600),
              color: AppColors.infoDark,
            )
          ],
        ),
      ),
    );
  }
}
