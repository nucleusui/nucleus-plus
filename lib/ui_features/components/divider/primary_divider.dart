import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';

class PrimaryDivider extends StatelessWidget {
  const PrimaryDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0,
      thickness: 0.5,
      color: AppColors.getColor(ColorKey.grey30),
    );
  }
}
