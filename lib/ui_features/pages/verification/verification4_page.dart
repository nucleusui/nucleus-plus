import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/input/pin_textfield.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Verification4Page extends StatefulWidget {
  const Verification4Page({super.key});

  @override
  State<Verification4Page> createState() => _Verification4PageState();
}

class _Verification4PageState extends State<Verification4Page> {
  late Timer _timer;
  double time = 12;

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() => time = 12);
    const duration = Duration(seconds: 1);
    _timer = Timer.periodic(duration, (Timer timer) {
      if (time > 0) {
        setState(() => time--);
      } else {
        _timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        actions: [
          Button.ghost(
            label: 'Change number',
            padding: EdgeInsets.zero,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          const Text(
            'Enter authentication code',
            textAlign: TextAlign.center,
            style: AssetStyles.h2,
          ),
          const SizedBox(height: 8),
          const Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              text: "Enter the 4-digit that we have sent via the phone number ",
              style: AssetStyles.pMd,
              children: [
                TextSpan(
                  text: '+62 813-8172-5977',
                  style: AssetStyles.h4,
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          PinTextField(
            onCompleted: (value) {
              debugPrint('pin value: $value');
              FocusManager().primaryFocus?.unfocus();
            },
          ),
          const Spacer(),
          Button.primary(
            label: 'Continue',
            buttonSize: ButtonSize.full,
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(height: 16),
          Button.secondary(
            label: time == 0 ? 'Resend' : 'Resend code in ${time.toInt()}s',
            onPressed: time == 0 ? () => _startTimer() : null,
            buttonSize: ButtonSize.full,
          ),
        ]),
      ),
    );
  }
}
