// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../utils/app_theme.dart';

class TossView extends StatefulWidget {
  const TossView({super.key});

  @override
  State<TossView> createState() => _TossViewState();
}

class _TossViewState extends State<TossView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Toss',
          style: TextStyle(color: AppColors.textPrimary),
        ),
        backgroundColor: AppColors.primaryLighter,
      ),
    );
  }
}
