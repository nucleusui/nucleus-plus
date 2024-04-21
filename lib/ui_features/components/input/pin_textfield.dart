import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nucles_app/config/config.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinTextField extends StatelessWidget {
  const PinTextField({
    super.key,
    this.onCompleted,
    this.length = 5,
  });

  final int length;
  final void Function(String)? onCompleted;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: length,
      autoFocus: true,
      obscureText: true,
      cursorColor: Colors.transparent,
      animationType: AnimationType.none,
      mainAxisAlignment: MainAxisAlignment.center,
      textStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: AppColors.getColor(ColorKey.grey100),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      animationDuration: const Duration(milliseconds: 10),
      enableActiveFill: true,
      beforeTextPaste: (text) => true,
      onCompleted: onCompleted,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.circle,
        fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 8),
        fieldHeight: 48,
        fieldWidth: 50,
        activeBorderWidth: 1,
        activeBoxShadow: [
          BoxShadow(
            color: AppColors.getColor(ColorKey.primary30),
            offset: const Offset(0, 0),
            blurRadius: 1,
            spreadRadius: 5,
          ),
        ],
        inactiveBorderWidth: 1,
        selectedFillColor: AppColors.getColor(ColorKey.background),
        activeFillColor: AppColors.getColor(ColorKey.background),
        inactiveFillColor: AppColors.getColor(ColorKey.background),
        selectedColor: AppColors.getColor(ColorKey.primary50),
        activeColor: AppColors.getColor(ColorKey.grey30),
        inactiveColor: AppColors.getColor(ColorKey.grey20),
      ),
    );
  }
}
