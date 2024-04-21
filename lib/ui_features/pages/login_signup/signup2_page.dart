import 'package:flutter/material.dart';
import 'package:nucles_app/config/config.dart';
import 'package:nucles_app/ui_features/components/appbar/primary_appbar.dart';
import 'package:nucles_app/ui_features/components/button/primary_button.dart';
import 'package:nucles_app/ui_features/components/image/primary_asset_image.dart';
import 'package:nucles_app/ui_features/components/input/primary_textfield.dart';
import 'package:nucles_app/utils/form_validator.dart';

class Signup2Page extends StatefulWidget {
  const Signup2Page({super.key});

  @override
  State<Signup2Page> createState() => _Signup2PageState();
}

class _Signup2PageState extends State<Signup2Page> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(actions: [
        Text(
          'Login',
          style: AssetStyles.h3
              .copyWith(color: AppColors.getColor(ColorKey.primary60)),
        ),
      ]),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        child: Column(children: [
          const Text('Join Nucleus', style: AssetStyles.h1),
          const SizedBox(height: 8),
          Text(
            'Start building your design system with our\ncomponent library',
            textAlign: TextAlign.center,
            style: AssetStyles.pMd
                .copyWith(color: AppColors.getColor(ColorKey.grey60)),
          ),
          const SizedBox(height: 24),
          PrimaryTextField(
            controller: emailController,
            labelText: "Email",
            hintText: "example@org.com",
            textInputType: TextInputType.emailAddress,
            validator: FormValidator.email,
            textInputAction: TextInputAction.done,
            onChanged: (e) => setState(() {}),
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            label: "Get Started",
            width: double.infinity,
            onTap: emailController.text.isEmpty ? null : () {},
          ),
          const SizedBox(height: 24),
          Stack(alignment: Alignment.center, children: [
            Divider(thickness: 1, color: AppColors.getColor(ColorKey.grey20)),
            Container(
              color: AppColors.getColor(ColorKey.background),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'OR',
                style: AssetStyles.labelXs.copyWith(
                  color: AppColors.getColor(ColorKey.grey50),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ]),
          const SizedBox(height: 24),
          PrimaryButton(
            width: double.infinity,
            color: Colors.black,
            padding: const EdgeInsets.only(left: 16, right: 32),
            prefixIcon: const PrimaryAssetImage(AssetPaths.icApple),
            label: 'Continue with Apple',
            onTap: () {},
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            width: double.infinity,
            color: AppColors.getColor(ColorKey.grey10),
            labelColor: AppColors.getColor(ColorKey.grey100),
            padding: const EdgeInsets.only(left: 16, right: 32),
            prefixIcon: const PrimaryAssetImage(AssetPaths.icGoogle),
            label: 'Continue with Google',
            onTap: () {},
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            width: double.infinity,
            color: AssetColors.blue,
            label: 'Continue with Facebook',
            padding: const EdgeInsets.only(left: 16, right: 32),
            prefixIcon: const PrimaryAssetImage(AssetPaths.icFacebook),
            onTap: () {},
          ),
        ]),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            text: 'By registering you agree to\nour ',
            style: AssetStyles.pXs.copyWith(
              height: 1.4,
              color: AppColors.getColor(ColorKey.grey50),
            ),
            children: [
              TextSpan(
                text: 'Terms of Use',
                style: AssetStyles.pXs.copyWith(
                  color: AppColors.getColor(ColorKey.grey100),
                ),
              ),
              const TextSpan(text: ' and '),
              TextSpan(
                text: 'Privacy Policy',
                style: AssetStyles.pXs.copyWith(
                  color: AppColors.getColor(ColorKey.grey100),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
