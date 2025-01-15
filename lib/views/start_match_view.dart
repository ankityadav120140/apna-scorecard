// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:apna_scorecard/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/app_routes.dart';
import '../utils/app_theme.dart';
import './widgets/custom_input_field.dart';
import '../viewmodels/match_viewmodel.dart';

class StartMatchView extends StatefulWidget {
  const StartMatchView({super.key});

  @override
  _StartMatchViewState createState() => _StartMatchViewState();
}

class _StartMatchViewState extends State<StartMatchView> {
  final _formKey = GlobalKey<FormState>();
  final _team1Controller = TextEditingController();
  final _team2Controller = TextEditingController();
  final _oversController = TextEditingController();

  @override
  void dispose() {
    _team1Controller.dispose();
    _team2Controller.dispose();
    _oversController.dispose();
    super.dispose();
  }

  void _startMatch(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      final team1Name = _team1Controller.text.trim();
      final team2Name = _team2Controller.text.trim();
      final totalOvers = int.parse(_oversController.text.trim());

      Provider.of<MatchViewModel>(context, listen: false).startMatch(
        team1Name,
        team2Name,
        totalOvers,
      );
      Navigator.pushNamed(context, AppRoutes.toss);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all fields correctly')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Start Match'),
        backgroundColor: AppColors.primaryLighter,
      ),
      backgroundColor: AppColors.primaryLightest,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Padding(
          padding: EdgeInsets.only(
            bottom:
                MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextField(
                  controller: _team1Controller,
                  labelText: 'Team 1 Name',
                  isRequired: true,
                ),
                SizedBox(height: 10),
                CustomTextField(
                  controller: _team2Controller,
                  labelText: 'Team 2 Name',
                  isRequired: true,
                ),
                SizedBox(height: 10),
                CustomTextField(
                  controller: _oversController,
                  keyboardType: TextInputType.number,
                  labelText: 'Total Overs',
                  isRequired: true,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Total overs is required';
                    }
                    final overs = int.tryParse(value);
                    if (overs == null || overs <= 0) {
                      return 'Please enter a valid number of overs';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                customButton(
                    onTap: () => Navigator.pushNamed(context, AppRoutes.toss),
                    // _startMatch(context),
                    text: 'Proceed To Toss',
                    style: textStyle.labelLarge?.copyWith(
                        fontWeight: FontWeight.w600, color: AppColors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
