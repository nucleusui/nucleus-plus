import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/dropdown/country_dropdown.dart';
import 'package:nucles_app/ui_features/components/image/universal_image.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

class Login1Page extends StatelessWidget {
  const Login1Page({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController numberController = TextEditingController();
    return Scaffold(
      appBar: const PrimaryAppBar(),
      floatingActionButton: Button.primary(
        icon: UniversalImage(AssetPaths.icArrowRight),
        onPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text("Log in", style: AssetStyles.h1),
          const SizedBox(height: 8),
          Text(
            'Enter your mobile number',
            style: AssetStyles.pMd.copyWith(height: 0.8),
          ),
          const SizedBox(height: 28),
          InputField(
            controller: numberController,
            prefixIcon: const CountryDropdown(),
            hintText: "Placeholder text",
          ),
          const SizedBox(height: 15),
          Text(
            'You will receive an SMS verification that may apply message and data rates.',
            style: AssetStyles.pXs
                .copyWith(color: AppColors.getColor(ColorKey.grey50)),
          ),
        ]),
      ),
    );
  }
}
