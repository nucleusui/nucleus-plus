import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';

class PrimaryCheckBox extends StatelessWidget {
  const PrimaryCheckBox({
    super.key,
    required this.value,
    this.onChanged,
    this.size = 15,
    this.scale = 1,
  });

  final Function(bool?)? onChanged;
  final bool value;
  final double size;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Transform.scale(
        scale: scale,
        child: Checkbox(
          value: value,
          onChanged: onChanged,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          activeColor: AppColors.getColor(ColorKey.primary60),
          side: BorderSide(color: AppColors.getColor(ColorKey.grey20)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
      ),
    );
  }
}
